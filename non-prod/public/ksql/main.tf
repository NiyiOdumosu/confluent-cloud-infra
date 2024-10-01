resource "confluent_service_account" "app-ksql" {
  display_name = var.ksql_app_id
  description  = "Service account to manage ${var.ksql_cluster} ksqlDB cluster"
}

resource "confluent_role_binding" "app-ksql-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.basic.rbac_crn
}

resource "confluent_ksql_cluster" "ksql" {
  display_name = var.ksql_cluster
  csu          = 12
  kafka_cluster {
    id = confluent_kafka_cluster.basic.id
  }
  credential_identity {
    id = confluent_service_account.app-ksql.id
  }
  environment {
    id = data.confluent_environment.env.id
  }
  depends_on = [
    confluent_role_binding.app-ksql-kafka-cluster-admin,
    confluent_schema_registry_cluster.essentials
  ]
}

resource "confluent_api_key" "ksqldb-api-key" {
  display_name = "ksqldb-api-key"
  description  = "KsqlDB API Key that is owned by 'app-manager' service account"
  owner {
    id          = confluent_service_account.app-ksql.id
    api_version = confluent_service_account.app-ksql.api_version
    kind        = confluent_service_account.app-ksql.kind
  }

  managed_resource {
    id          = confluent_ksql_cluster.ksql.id
    api_version = confluent_ksql_cluster.ksql.api_version
    kind        = confluent_ksql_cluster.ksql.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
