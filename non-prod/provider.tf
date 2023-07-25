terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.40.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         	   = "niyi-tf-backend-non-prod"
    key                = "state/terraform.tfstate"
    region         	   = "us-east-1"
  }
}

provider "confluent" {
  # Configuration options
  cloud_api_key    = var.confluent_api_key
  cloud_api_secret = var.confluent_api_secret
}

provider "aws" {
  region = "us-east-1"
}

