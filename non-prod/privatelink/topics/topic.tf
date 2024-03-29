 resource "confluent_kafka_topic" "REPLACE_ME" {
   kafka_cluster {
     id = confluent_kafka_cluster.dedicated.id
   }
   topic_name         = "REPLACE_ME"
   partitions_count   = 3
   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
   config = {

   }
   credentials {
     key    = confluent_api_key.producer-api-key.id
     secret = confluent_api_key.producer-api-key.secret
   }
 }