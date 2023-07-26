//
// resource "confluent_kafka_topic" "authentication-service-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "authentication-service-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "authentication-service-send-signup-details" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "authentication-service-send-signup-details"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "authentication-service-send-user-details-to-services" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "authentication-service-send-user-details-to-services"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "authentication-service-send-user-details-to-services-qa" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "authentication-service-send-user-details-to-services-qa"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "authentication-service-signup-with-referral-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "authentication-service-signup-with-referral-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "company-service-news-mention-notification" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "company-service-news-mention-notification"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "company-service-user-follow-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "company-service-user-follow-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "development-investing-db-trades-investing-db-trades" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "development.investing-db.trades.investing-db.trades"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "investment-service-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "investment-service-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "investment-service-send-company-information" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "investment-service-send-company-information"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "investment-service-send-details-to-interested-services" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "investment-service-send-details-to-interested-services"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "investment-service-send-user-invested-amount" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "investment-service-send-user-invested-amount"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "investment-service-webhooks" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "investment-service-webhooks"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "messaging-service-direct-message-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "messaging-service-direct-message-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "messaging-service-group-message-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "messaging-service-group-message-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "messaging-service-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "messaging-service-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-company-recent-mention" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-company-recent-mention"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-push-notifications" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-push-notifications"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-recent-mention-in-the-news-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-recent-mention-in-the-news-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-seed-news-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-seed-news-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-send-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-send-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "news-service-subscriptions-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "news-service-subscriptions-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "notification-service-fanout-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "notification-service-fanout-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "notification-service-investment-request-details" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "notification-service-investment-request-details"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "pksqlc-1k006-processing-log" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "pksqlc-1k006-processing-log"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "pksqlc-1k006USERS_FILTERED" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "pksqlc-1k006USERS_FILTERED"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "subscription-service" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "subscription-service"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "topic_22" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "topic_22"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-get-user-invested-amount" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-get-user-invested-amount"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-groups-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-groups-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-groups-topic-qa" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-groups-topic-qa"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-news-reaction" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-news-reaction"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-push-notifications-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-push-notifications-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-send-signup-details" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-send-signup-details"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-send-user-details" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-send-user-details"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-send-user-details-qa" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-send-user-details-qa"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-signup-with-referral-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-signup-with-referral-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-test-topic" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-test-topic"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
// resource "confluent_kafka_topic" "users-service-users-reactions" {
//   kafka_cluster {
//     id = confluent_kafka_cluster.dedicated.id
//   }
//   topic_name         = "users-service-users-reactions"
//   partitions_count   = 3
//   rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
//   config = {
//
//   }
//   credentials {
//     key    = confluent_api_key.producer-api-key.id
//     secret = confluent_api_key.producer-api-key.secret
//   }
// }
