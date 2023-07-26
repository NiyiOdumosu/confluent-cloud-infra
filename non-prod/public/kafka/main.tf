resource "confluent_kafka_cluster" "dedicated" {
  display_name = var.cluster_name
  availability = "SINGLE_ZONE"
  cloud        = "AWS"
  region       = var.region
  dedicated {
    cku = 2
  }

  environment {
    id = data.confluent_environment.env.id
  }
}

data "confluent_environment" "env" {
  display_name = "niyi"
}

resource "confluent_service_account" "app-producer" {
  display_name = "app-producer-service-account"
  description  = "Service Account for app producer"
}

resource "confluent_role_binding" "developer-write" {
  principal   = "User:${confluent_service_account.app-producer.id}"
  role_name   = "DeveloperWrite"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/topic=*"
}
resource "confluent_api_key" "producer-api-key" {
  display_name = "producer-api-key"
  description  = "Kafka API Key that is owned by 'producer' service account"
  owner {
    id          = confluent_service_account.app-producer.id
    api_version = confluent_service_account.app-producer.api_version
    kind        = confluent_service_account.app-producer.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.dedicated.id
    api_version = confluent_kafka_cluster.dedicated.api_version
    kind        = confluent_kafka_cluster.dedicated.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }
  depends_on = [
    confluent_role_binding.developer-write
  ]
}