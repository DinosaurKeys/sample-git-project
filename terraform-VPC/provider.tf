terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }

# This backend configuration is for storing the Terraform state file in an S3 bucket.

  backend "s3" {
    bucket = "s3bucket-terraform-1"
    key    = "prod/terraform.tfstate"
    region = "eu-central-1"
  }

}

provider "aws" {
  region = "eu-central-1"
}


