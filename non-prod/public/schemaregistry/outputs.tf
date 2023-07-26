output "environment_id" {
  value       = confluent_schema_registry_cluster.essentials.environment[0].id
  description = "The ID of the Environment that the Schema Registry cluster belongs to."
}

output "id" {
  value       = confluent_schema_registry_cluster.essentials.id
  description = "The ID of the Schema Registry cluster, for example, lsrc-abc123."
}

output "api_version" {
  value       = confluent_schema_registry_cluster.essentials.api_version
  description = "An API Version of the schema version of the Schema Registry cluster, for example, srcm/v2."
}

output "kind" {
  value       = confluent_schema_registry_cluster.essentials.kind
  description = "A kind of the Schema Registry cluster, for example, Cluster."
}

output "resource_name" {
  value       = confluent_schema_registry_cluster.essentials.resource_name
  description = "The Confluent Resource Name of the Schema Registry cluster."
}