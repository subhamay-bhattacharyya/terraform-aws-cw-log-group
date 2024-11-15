![](https://img.shields.io/github/commit-activity/t/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/last-commit/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/release-date/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/repo-size/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/directory-file-count/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/issues/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/languages/top/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/commit-activity/m/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bsubhamay/542e7dd810fa5d2b3734eb2a820139b1/raw/terraform-aws-cw-log-group.json?)

# Terraform AWS CloudWatch LogGroup Module

This Terraform module creates an AWS CloudWatch LogGroup with various configurations.

## Usage

```hcl
module "cw_log_group" {
  source   = "app.terraform.io/subhamay-bhattacharyya/cw-log-group/aws"
  version  = "1.0.0"

  aws-region                   = "us-east-1"
  project-name                 = "your-project"
  environment-name             = "your-environment"
  log-group-base-name          = "your-log-group-base-name"
  log-group-class              = "STANDARD"
  retention-in-days            = 14
  kms-key-id                   = "arn:aws:kms:us-east-1:637423502513:key/494509e4-3bc5-44b8-9c4d-12449900d395
  skip-destroy                 = false
  log-group-tags               = {
    Key1      = "value-1"
    Key2      = "value-2"
  }
  ci-build = ""
}
```

## Inputs

| Name                      | Description                                                     | Type          | Default     | Required |
|---------------------------|-----------------------------------------------------------------|---------------|-------------|----------|
| aws-region                | The AWS region to deploy resources                              | string        | "us-east-1" | no       |
| project-name              | The name of the project                                         | string        | "gitops"    | no       |
| environment-name          | The environment in which to deploy resources                    | string        | "devl"      | no       |
| log-group-base-name       | The base name of the CloudWatch LogGroup                        | string        | n/a         | yes      |
| log-group-class           | The log class of the CloudWatch LogGroup                        | string        | "STANDARD"  | no       |
| retention-in-days         | The CloudWatch LogGroup retention period                        | number        | 14          | no       |
| kms-key-id                | The KMS key ID used to encrypt the log group                    | string        | null        | no       |
| skip-destroy              | Specify if the LogGroup destroy should be skipped               | bool          | null        | no       |
| log-group-tags            | A map of tags to assign to the CloudWatch LogGroup              | map(string)   | {}          | no       |
| ci-build                  | CI build identifier                                             | string        | ""          | no       |

## Outputs

| Name                      | Description                                                     |
|---------------------------|-----------------------------------------------------------------|
| glue_job_arn              | The ARN of the Glue ETL Job                                     |
| glue_job_id               | The name of the Glue ETL Job                                    |
| glue_tags_all             | The tags of the Glue ETL Job                                    |