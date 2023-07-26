# confluent-cloud-infra

# Provisioning Confluent Resources with Terraform
This README provides information on how to use the Confluent and Azure Terraform Provider to provision and manage Confluent resources using Terraform. The Confluent Terraform Provider is an official provider from Confluent that allows you to manage Confluent resources such as Kafka clusters, schema registry clusters, Kafka topics, service accounts, and KSQL clusters.

## Prerequisites
Before you begin, make sure you have the following:

An account with Confluent Cloud
Terraform version 0.13.0 or later
Confluent Terraform Provider
You can download the Confluent Terraform Provider by visiting this [link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).


## Set Up Terraform Locally

Save your Terraform configuration file and run `terraform init` to initialize your working directory.
Run `terraform plan` to see a preview of the resources that will be created or updated.
If there are no errors in the output, save the plan so that terraform can version the state of Confluent infrastructure.
You can do this by running:

`terraform plan -o plans/<env>-<version>.tf`

If everything looks good, run `terraform apply` to create or update your resources.
That's it! You've now successfully provisioned Confluent resources using Terraform.


## Run Confluent Cloud Infra with Github Actions

Add a github workflow file to the .github/ directory. To use the terraform-plan or terraform-apply actions, add the action to your workflow yaml file. Please remember to generate a GITHUB Token from your account and add it as `WORKFLOW_TOKEN` to your pipeline file.

  ```
  jobs:
  plan:
  runs-on: ubuntu-latest
  name: Create a plan for the terraform configuration
  env:
  GITHUB_TOKEN: ${{ secrets.WORKFLOW_TOKEN }}
  steps:
  - name: Checkout
  uses: actions/checkout@v2

  - name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
  aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
  aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  aws-region: us-east-1
  ```


  ## Provisioning Confluent Resources
You can create resources such as Kafka clusters, schema registry clusters, Kafka topics, service accounts, and KSQL clusters using the confluent_kafka_cluster, confluent_schema_registry_cluster, confluent_kafka_topic, confluent_service_account, and confluent_ksql_cluster resources respectively. Below are snippets of the configurations for each cluster:

### Provider
To provision resources using the Confluent Terraform Provider, follow these steps:

Create a new Terraform configuration file with the .tf extension.
Add the Confluent Terraform Provider configuration to your file. This should include your Confluent Cloud API key and secret to provision your resources. We also set up the remote bucket to store the terraform's state in s3. More info on configuring the S3 backend can be found [here](https://developer.hashicorp.com/terraform/language/settings/backends/s3). Below is the configuration from `provider.tf`:

```terraform
terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.29.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         	   = "niyi-tf-backend-non-prod"
    key                = "state/terraform.tfstate"
    region         	   = "us-east-1"
  }
}

provider "confluent" {
  # Configuration options
  cloud_api_key    = var.confluent_api_key
  cloud_api_secret = var.confluent_api_secret

}

provider "aws" {
  region = "us-east-1"
}

}
```
The above terraform script specifies the Confluent provider version well as the AWS version.

For more information on provisioning Kafka clusters, visit the Terraform provider [documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs).


### Kafka Cluster

The cluster script below shows a public dedicated cluster.
```terraform
resource "confluent_kafka_cluster" "standard" {
  display_name = var.cluster_name
  availability = "MULTI_ZONE"
  cloud        = "AZURE"
  region       = var.region
  dedicated {
    cku = var.cluster_cku
  }

  environment {
    id = data.confluent_environment.env.id
  }
}

data "confluent_environment" "env" {
  display_name = var.env_name
}

```

For more information on provisioning Kafka clusters, visit the Terraform Kafka [documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_kafka_cluster).

### ksql Cluster

The script below creates a service account for the ksqlDB cluster and assigns it an RBAC role of CloudClusterAdmin.
Then it specifies the number of CSUs needed for the ksql cluster as well as the Kafka cluster the ksqlDB cluster will be assigned to.

```terraform
resource "confluent_service_account" "app-ksql" {
  display_name = var.ksql_app_id
  description  = "Service account to manage ${var.ksql_cluster} ksqlDB cluster"
}

resource "confluent_role_binding" "app-ksql-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.dedicated.rbac_crn
}

resource "confluent_ksql_cluster" "ksql" {
  display_name = var.ksql_cluster
  csu          = 8
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  credential_identity {
    id = confluent_service_account.app-ksql.id
  }
  environment {
    id = data.confluent_environment.env.id
  }
  depends_on = [
    confluent_role_binding.app-ksql-kafka-cluster-admin,
    confluent_schema_registry_cluster.advanced
  ]
}
```

For more information on provisioning Kafka clusters, visit the Terraform Kafka [documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_ksql_cluster).


### Schema Registry Cluster

The script below creates a service account for the SR cluster and assigns it an RBAC role of EnvironmentAdmin.
Schema Registry is a cluster that is shared by all the resources within that environment.

```terraform


data "confluent_schema_registry_region" "pods_prod" {
  cloud   = "AZURE"
  region  = "eastus"
  package = "ADVANCED"
}

resource "confluent_service_account" "env-manager" {
  display_name = "env-manager"
  description  = "Service account to manage 'production' environment Kafka Schema Registry"
}

resource "confluent_role_binding" "env-manager-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.env-manager.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = var.prod_env_crn
}

resource "confluent_api_key" "env-manager-schema-registry-api-key" {
  display_name = "env-manager-schema-registry-api-key"
  description  = "Schema Registry API Key that is owned by 'env-manager' service account"
  owner {
    id          = confluent_service_account.env-manager.id
    api_version = confluent_service_account.env-manager.api_version
    kind        = confluent_service_account.env-manager.kind
  }

  managed_resource {
    id          = confluent_schema_registry_cluster.advanced.id
    api_version = confluent_schema_registry_cluster.advanced.api_version
    kind        = confluent_schema_registry_cluster.advanced.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
```

For more information on provisioning Kafka clusters, visit the Terraform Schema Registry [documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_schema_registry_cluster).

### Topics

The text file `hvr_topics.txt` has all the source topics in the PODS Confluent Kafka cluster. These topics are given schemas by the HVR Producer.
Since there is a large and growing list of topics, we use bash scripting to create a `topics.tf` file with the topic configurations.
Run the `terraform_<env>.sh` script to create terraform topic resources from the `hvr_topics.txt`.
The script replaces the `REPLACE_ME` substrings from the `topic.tf` file and outputs it to the `topics.tf` file.

Below is an example of a topic resource.

```terraform

resource "confluent_kafka_topic" "hvr_companygroupitems" {
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  topic_name         = "hvr_companygroupitems"
  partitions_count   = 6
  rest_endpoint      = confluent_kafka_cluster.dedicated.rest_endpoint
  config = {
    "cleanup.policy"    = "delete"
  }
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}
```

For more information on provisioning Kafka clusters, visit the Terraform Topics [documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_kafka_topic).

### Authorization (Service Accounts & ACLs)
Service Accounts and ACLs can also be created. Below is an example of a producer service account, RBAC role, api-key, and ACL being created.

```terraform
resource "confluent_service_account" "hvr-producer" {
  display_name = "hvr-producer-service-account"
  description  = "Service Account for hvr app"
}

resource "confluent_role_binding" "developer-write" {
  principal   = "User:${confluent_service_account.hvr-producer.id}"
  role_name   = "DeveloperWrite"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/topic=hvr*"
}
resource "confluent_api_key" "hvr-producer-api-key" {
  display_name = "hvr-producer-api-key"
  description  = "Kafka API Key that is owned by 'hvr-producer' service account"
  owner {
    id          = confluent_service_account.hvr-producer.id
    api_version = confluent_service_account.hvr-producer.api_version
    kind        = confluent_service_account.hvr-producer.kind
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

resource "confluent_kafka_acl" "pods_hvr_producer_acl" {
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  resource_type = "TOPIC"
  resource_name = var.resource_name
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.hvr-producer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = confluent_kafka_cluster.dedicated.rest_endpoint
  credentials {
    key = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret

  }
}
```

For more information on provisioning Kafka clusters, visit the links below:

* [Service Accounts](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_service_account).
* [Api Keys](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_service_account).
* [Role Binding](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_role_binding)
* [ACLs](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_kafka_acl)


### Terraform Variables

It's important to note that any terraform variable (i.e. `var.variable_name`) has a value that is populated from the `terraform.tfvars`

```
env_name = ''
non_prod_env_crn = ''
purpose = ''
cluster_cku = ''
cluster_name = ''
ksql_cluster = ''
owner_email = ''
region = ''
resource_name = ''
confluent_api_key = ''
confluent_api_secret = ''
```




### Conclusion
The Confluent Terraform Provider makes it easy to provision and manage Confluent resources using Terraform.
By following the steps outlined in this README, you can quickly get started with provisioning resources such as Kafka clusters, schema registry clusters, Kafka topics, service accounts, and KSQL clusters.

Additional Resources
For more information on the Confluent Terraform Provider and how to use it, check out the following resources:

[Confluent Terraform Provider documentation](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs)
