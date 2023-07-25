output "rbac_crn" {
  value       = confluent_kafka_cluster.dedicated.rbac_crn
  description = "The Confluent Resource Name of the Kafka cluster."
}

output "id" {
  value       = confluent_kafka_cluster.dedicated.id
  description = "The ID of the Kafka cluster."
}

output "api_version" {
  value       = confluent_kafka_cluster.dedicated.api_version
  description = "An API Version of the schema version of the Kafka cluster, for example, cmk/v2."
}

output "kind" {
  value       = confluent_kafka_cluster.dedicated.kind
  description = "A kind of the Kafka cluster, for example, Cluster."
}

output "rest_endpoint" {
  value       = confluent_kafka_cluster.dedicated.rest_endpoint
  description = "The REST endpoint of the Kafka cluster."
}

output "bootstrap_endpoint" {
  value       = confluent_kafka_cluster.dedicated.bootstrap_endpoint
  description = "The bootstrap endpoint used by Kafka clients to connect to the Kafka cluster."
}

output "region" {
  value       = confluent_kafka_cluster.dedicated.region
  description = "The cloud service provider region where the Kafka cluster is running."
}

output "environment_id" {
  value       = confluent_kafka_cluster.dedicated.environment[0].id
  description = "The ID of the Environment that the Kafka cluster belongs to."
}