variable "ACCOUNT_ID" {
  type = string
}

variable "AWS_DEFAULT_REGION" {
  type = string
}

variable "environment" {
  type = string
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
