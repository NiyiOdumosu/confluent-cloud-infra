variable "owner_email" {
  description = "Owner Email"
  type        = string
}

variable "purpose" {
  description = "Purpose"
  type        = string
}

variable "env_name" {
  description = "Confluent Cloud Environment Name"
  type        = string
}



variable "resource_name" {
  description = "Owner of the ACL"
  type        = string
}

variable "ksql_cluster" {
  description = "ksql cluster name"
  type        = string
}

variable "ksql_app_id" {
  description = "ksql app id"
  type        = string
}

variable "cku" {
  description = "Number of Confluent Units for Kafka. This determines the capacity for the cluster."
  type        = number
}

variable "cluster_name" {
  description = "Confluent Cloud Cluster Name"
  type        = string
}

variable "private_link_id" {
  description = "The ID of the private link"
  type        = string
  default     = null
}

variable "private_link_cloud" {
  description = "The cloud service provider in which the network exists. Accepted values are: AWS, AZURE, and GCP."
  type        = string
  default     = null

}

variable "private_link_region" {
  description = "The cloud provider region where the network exists."
  type        = string
  default     = null
}


variable "confluent_api_key" {
  description = "Cloud API KEY"
  type        = string
}

variable "confluent_api_secret" {
  description = "Cloud API SECRET"
  type        = string
}

variable "non_prod_env_crn" {
  description = "NON PROD Environment CRN"
  type        = string
}

variable "environment_id" {
  description = "Confluent Cloud Environment ID"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to private link to Confluent Cloud"
  type        = string
}

variable "subnets_to_privatelink" {
  description = "A map of Zone ID to Subnet ID (ie: {\"use1-az1\" = \"subnet-abcdef0123456789a\", ...})"
  type        = map(string)
}

variable "aws_account_id" {
  description = "The Account Id of the AWS Account"
  type        = string
}


variable "ec2_proxy_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "NginxProxy"
}
variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "Key to access the EC2 instance"
  type        = string
}
variable "subnet" {
  description = "Subnet ID"
  type        = string
}
