 resource "confluent_kafka_topic" "topic_a" {
   kafka_cluster {
     id = confluent_kafka_cluster.basic.id
   }
   topic_name         = "topic_a"
   partitions_count   = 3
   rest_endpoint      = confluent_kafka_cluster.basic.rest_endpoint
   config = {

   }
   credentials {
     key    = confluent_api_key.producer-api-key.id
     secret = confluent_api_key.producer-api-key.secret
   }

  resource "confluent_kafka_topic" "topic_b" {
   kafka_cluster {
     id = confluent_kafka_cluster.basic.id
   }
   topic_name         = "topic_b"
   partitions_count   = 3
   rest_endpoint      = confluent_kafka_cluster.basic.rest_endpoint
   config = {

   }
   credentials {
     key    = confluent_api_key.producer-api-key.id
     secret = confluent_api_key.producer-api-key.secret
   }
  } 

 resource "confluent_kafka_topic" "topic_c" {
   kafka_cluster {
     id = confluent_kafka_cluster.basic.id
   }
   topic_name         = "topic_c"
   partitions_count   = 3
   rest_endpoint      = confluent_kafka_cluster.basic.rest_endpoint
   config = {

   }
   credentials {
     key    = confluent_api_key.producer-api-key.id
     secret = confluent_api_key.producer-api-key.secret
   }
 }
