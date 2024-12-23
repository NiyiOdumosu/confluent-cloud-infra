terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "2.3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         	   = "confluent-cloud-infra"
    key                = "schemaregistry/terraform.tfstate"
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

terraform {
  required_version = ">1.3.0"
}
