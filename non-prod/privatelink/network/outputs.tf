output "id" {
  value       = confluent_network.private-link.id
  description = "The ID of the Environment, for example, env-abc123."
}

output "cloud" {
  value       = confluent_network.private-link.cloud
  description = "The cloud service provider in which the network exists. Accepted values are: AWS, AZURE, and GCP."
}

output "region" {
  value       = confluent_network.private-link.region
  description = "The cloud provider region where the network exists."
}

output "private_link_endpoint_service" {
  value       = confluent_network.private-link.aws[0].private_link_endpoint_service
  description = "The endpoint service of the Confluent Cloud VPC (used for PrivateLink) if available."
}