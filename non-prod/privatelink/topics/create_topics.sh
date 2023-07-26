#!/bin/bash

# `topic.tmpl` is a template file.  The file replaces REPLACE_ME with a topic
# found in the file `my_topics.txt`
topic_tf="topic.tmpl"
# `my_topics.txt` contains the name of topics to create
topics="topics.txt"
# This script will concatenate to `topics_output`
topics_output=""
# IFS resolves control character issues
IFS=''
# `custer.tmpl` is a template.  This script will create `cluster.tf`, which
# is a proper Terraform script
cp topic.tmpl topic.tf
while read topic; do
  # Look for the string `REPLACE_ME` and replace it
  topic=$(sed "s/REPLACE_ME/$topic/g" $topic_tf)
  # Terraform is picky about control characters (\n)
  topics_output=`echo -e "$topics_output\n$topic"`
done < $topics
# Write the output to a proper terraform file.  `cluster.tf` is a proper
# terraform file and can be used with `terraform apply`
echo $topics_output >> "topics.tf"
