/*
/*
####################################################################################################
# Terraform Glue Job Outputs Configuration
#
# Description: This module creates a CloudWatch LogGroup using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 15-Nov-2024  Updated: 
# Version: 1.0
#
####################################################################################################
*/


output "cw_log_group_arn" {
  description = "The ARN of the CloudWatch LogGroup"
  value       = aws_cloudwatch_log_group.cloudwatch_log_group.arn
}

output "cw_log_group_tags_all" {
  description = "The tags of the CloudWatch LogGroup"
  value       = aws_cloudwatch_log_group.cloudwatch_log_group.tags_all
}
