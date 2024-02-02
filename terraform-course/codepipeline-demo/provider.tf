terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
}

data "aws_availability_zones" "available" {
}

data "aws_caller_identity" "current" {
}
