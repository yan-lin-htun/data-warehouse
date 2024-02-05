terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }

  backend "s3" {
    bucket   = "prod-bi-tfstate-bucket"
    key      = "terraform.tfstate"
    region   = "ap-southeast-1"
    encrypt  = "true"
    dynamodb_table = "prod-bi-s3-state-backed-bucket"
  }
}

provider "aws" {
  region     = var.aws-region
}

