variable "environment" {
  type        = string
  description = "the name of the environment of this deployment"
  default     = "dev"
  nullable    = false
}

variable "ec2_size" {
  type    = string
  default = "t2.micro"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_size

  tags = {
    Name = var.environment
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}


output "region" {
  description = "Deploy Region"
  value       = data.aws_region.current.name
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
