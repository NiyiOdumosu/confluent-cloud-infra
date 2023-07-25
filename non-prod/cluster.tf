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
