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

variable "cluster_name" {
  description = "Confluent Cloud Cluster Name"
  type        = string
}


variable "resource_name" {
  description = "Owner of the ACL"
  type        = string
}

variable "region" {
  description = "AWS Region"
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
