/*
####################################################################################################
# Terraform Data Blocks Configuration
#
# Description: This module creates a CloudWatch LogGroup using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 15-Nov-2024  Updated: 
# Version: 1.0
#
####################################################################################################
*/

# --- root/data.tf ---

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}