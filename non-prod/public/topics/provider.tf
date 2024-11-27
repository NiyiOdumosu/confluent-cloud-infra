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
    key                = "topics/terraform.tfstate"
    region         	   = "us-east-1"
  }
}

provider "confluent" {
  # Configuration options
  cloud_api_key       = var.confluent_api_key
  cloud_api_secret    = var.confluent_api_secret
  kafka_id            = confluent_kafka_cluster.basic.id
  kafka_rest_endpoint = confluent_kafka_cluster.basic.rest_endpoint
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">1.3.0"
}
