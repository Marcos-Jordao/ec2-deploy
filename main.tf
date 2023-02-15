terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Configure the AWS Provider
provider "aws" {
  region = var.AWS_DEFAULT_REGION
  assume_role {
    role_arn = "arn:aws:iam::${var.ACCOUNT_ID}:role/Terraform_Assume"
  }
}

module "my-ec2" {
 source = "git::https://github.com/Marcos-Jordao/terraform-modules.git//ec2?ref=main"
 #source   = "./modules/ec2"
 environment = var.environment
 ec2_size = "t3a.micro"
}
