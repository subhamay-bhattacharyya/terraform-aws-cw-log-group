/*
####################################################################################################
# Terraform CloudWatch LogGroup Configuration
#
# Description: This module creates a CloudWatch LogGroup using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 15-Nov-2024  Updated: 
# Version: 1.0
#
####################################################################################################
*/


# --- CloudWatch LogGroup
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {

  name              = local.cw-log-group-name
  log_group_class   = var.log-group-class
  retention_in_days = var.retention-in-days
  kms_key_id        = var.kms-key-id == null ? null : var.kms-key-id
  skip_destroy      = var.skip-destroy == null ? false : var.skip-destroy

  tags = var.log-group-tags == null ? {} : var.log-group-tags
}