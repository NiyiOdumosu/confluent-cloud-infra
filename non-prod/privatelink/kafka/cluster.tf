resource "confluent_kafka_cluster" "dedicated" {
  display_name = var.cluster_name
  availability = "MULTI_ZONE"
  cloud        = local.private_link_cloud
  region       = local.private_link_region
  dedicated {
    cku = var.cku
  }
  environment {
    id = data.environment_id
  }
  network {
    id = var.private_link_id
  }
}

  environment {
    id = data.confluent_environment.env.id
  }
}

data "confluent_environment" "env" {
  display_name = "niyi"
}
