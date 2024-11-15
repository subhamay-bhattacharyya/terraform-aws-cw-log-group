/*
###################################################################################################
# Terraform Variables Configuration
#
# Description: This module creates a CloudWatch LogGroup using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 15-Nov-2024  Updated: 
# Version: 1.0
#
####################################################################################################
*/

######################################## AWS Configuration #########################################
variable "aws-region" {
  type    = string
  default = "us-east-1"
}

######################################## Project Name ##############################################
variable "project-name" {
  description = "The name of the project"
  type        = string
  default     = "gitops"
}

######################################## Environment Name ##########################################
variable "environment-name" {
  type        = string
  description = <<EOF
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOF
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment-name))
    error_message = "Err: environment is not valid."
  }
}

######################################## LogGroup Configuration ####################################
# CloudWatch LogGroup name
variable "log-group-base-name" {
  description = "The base name of the CloudWatch LogGroup"
  type        = string
}

# CloudWatch LogGroup class
variable "log-group-class" {
  description = "The log class of the CloudWatch LogGroup"
  type        = string
}

# CloudWatch LogGroup retention period
variable "retention-in-days" {
  description = "The ClodWatch LogGroup retention period"
  type        = number
  default     = 14
}

# The KMS key ID used  to encryp the log group
variable "kms-key-id" {
  description = "The LogGroup KMS key ID"
  type        = string
}

# Specify if the LogGroup destroy should be skipped
variable "skip-destroy" {
  description = "Skip the LogGroup destroy"
  type        = bool
  default     = null
}

# Default tags for the CloudWatch LogGroup
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default = {
    Environment      = "devl"
    ProjectName      = "terraform-aws-glue"
    GitHubRepository = "test-repo"
    GitHubRef        = "refs/heads/main"
    GitHubURL        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    GitHubSHA        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }
}

# CloudWatch LogGroup tags
variable "log-group-tags" {
  description = "A map of tags to assign to the CloudWatch LogGroup"
  type        = map(string)
  default     = null
}

######################################## GitHub ####################################################
# The CI build string
variable "ci-build" {
  description = "The CI build string"
  type        = string
  default     = "gitops"
}

######################################## Local Variables ###########################################
locals {
  cw-log-group-name = "${var.project-name}-${var.log-group-base-name}-${var.environment-name}-${var.aws-region}${var.ci-build}"
}