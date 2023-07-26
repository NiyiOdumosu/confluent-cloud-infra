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

resource "confluent_kafka_acl" "app_producer_acl" {
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.app-producer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = confluent_kafka_cluster.dedicated.rest_endpoint
  credentials {
    key = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret

  }
}

resource "confluent_service_account" "app-consumer" {
  display_name = "app-consumer-service-account"
  description  = "Service Account for app consumers"
}

resource "confluent_role_binding" "developer-read" {
  principal   = "User:${confluent_service_account.app-consumer.id}"
  role_name   = "DeveloperRead"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/topic=*"
}

resource "confluent_kafka_acl" "app_consumer_acl" {
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.app-consumer.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = confluent_kafka_cluster.dedicated.rest_endpoint
  credentials {
    key = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_api_key" "consumer-api-key" {
  display_name = "consumer-api-key"
  description  = "Kafka API Key that is owned by 'consumer' service account"
  owner {
    id          = confluent_service_account.app-consumer.id
    api_version = confluent_service_account.app-consumer.api_version
    kind        = confluent_service_account.app-consumer.kind
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
    confluent_role_binding.developer-read
  ]
}


resource "confluent_service_account" "app-manager" {
  display_name = "app-manager"
  description  = "Service account to manage 'non-production' the Kafka & ksqlDB clusters"
}

resource "confluent_role_binding" "app-manager-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.app-manager.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.dedicated.rbac_crn
}

resource "confluent_api_key" "app-manager-kafka-api-key" {
  display_name = "app-manager-kafka-api-key"
  description  = "Kafka API Key that is owned by 'app-manager' service account"
  owner {
    id          = confluent_service_account.app-manager.id
    api_version = confluent_service_account.app-manager.api_version
    kind        = confluent_service_account.app-manager.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.dedicated.id
    api_version = confluent_kafka_cluster.dedicated.api_version
    kind        = confluent_kafka_cluster.dedicated.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }
}

terraform {
  required_version = ">1.3.0"
}