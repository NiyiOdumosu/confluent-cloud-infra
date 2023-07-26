#!/bin/bash
# For more information on this script please visit https://docs.confluent.io/cloud/current/networking/ccloud-console-access.html#configure-a-proxy

# First install nginx, java and confluent platform on the ec2 instance

sudo apt update -y &&
sudo apt install -y nginx
sudo apt install -y default-jdk
wget https://downloads.apache.org/kafka/3.4.1/kafka_2.12-3.4.1.tgz

curl -O https://packages.confluent.io/archive/7.4/confluent-7.4.1.tar.gz
tar xzvf confluent-7.4.1.tar.gz

export CONFLUENT_HOME=confluent-7.4.1
export PATH=$PATH:$CONFLUENT_HOME/bin

cat << 'EOF' > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
  worker_connections 768;
  # multi_accept on;
}

stream {
  map $ssl_preread_server_name $targetBackend {
     default $ssl_preread_server_name;
 }

 server {
   listen 9092;

   proxy_connect_timeout 1s;
   proxy_timeout 7200s;

   # Run 'nslookup <ConfluentCloud_endpoint> 127.0.0.53' on nginx host to
   # verify resolver and check /var/log/nginx/error.log for any resolving
   # issues using 127.0.0.53
   resolver 127.0.0.53;

   # On lookup failure, reconfigure to use the cloud provider's resolver
   # resolver 169.254.169.253; # for AWS
   # resolver 168.63.129.16;  # for Azure
   # resolver 169.254.169.254;  # for Google

   proxy_pass $targetBackend:9092;
   ssl_preread on;
 }

 server {
   listen 443;
   proxy_connect_timeout 1s;
   proxy_timeout 7200s;
   resolver 127.0.0.53;
   proxy_pass $targetBackend:443;
   ssl_preread on;
 }

 log_format stream_routing '[$time_local] remote address $remote_addr'
                    'with SNI name "$ssl_preread_server_name" '
                    'proxied to "$upstream_addr" '
                    '$protocol $status $bytes_sent $bytes_received '
                    '$session_time';
 access_log /var/log/nginx/stream-access.log stream_routing;
}

http {

  ##
  # Basic Settings
  ##

  sendfile on;
  tcp_nopush on;
  types_hash_max_size 2048;
  # server_tokens off;

  # server_names_hash_bucket_size 64;
  # server_name_in_redirect off;

  include /etc/nginx/mime.types;
  default_type application/octet-stream;

  ##
  # SSL Settings
  ##

  ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
  ssl_prefer_server_ciphers on;

  ##
  # Logging Settings
  ##

  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;

  ##
  # Gzip Settings
  ##

  gzip on;

  # gzip_vary on;
  # gzip_proxied any;
  # gzip_comp_level 6;
  # gzip_buffers 16 8k;
  # gzip_http_version 1.1;
  # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

  ##
  # Virtual Host Configs
  ##

  include /etc/nginx/conf.d/*.conf;
  include /etc/nginx/sites-enabled/*;
}
EOF

# Restart Nginx service
systemctl restart nginx