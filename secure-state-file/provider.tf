terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "manoj-state"
    key    = "manoj-key"
    region = "us-east-1"
    dynamodb_table = "manoj-state"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
