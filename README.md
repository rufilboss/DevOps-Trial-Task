# Terraform Configuration for RNS GCP Cloud Run Service with Cloud SQL and Load Balancer

## Overview

This Terraform configuration uses modules to deploy resources for **RNS**:

- **Network Module**: Sets up a VPC network and subnet.
- **Cloud SQL Module**: Creates a Cloud SQL PostgreSQL database instance.
- **Cloud Run Module**: Deploys a Cloud Run service connected to the Cloud SQL database.
- **Load Balancer Module**: Configures an external HTTP Load Balancer to route traffic to the Cloud Run service.

## Prerequisites

- **Terraform** installed (version >= 0.12)
- A **Google Cloud Platform** (GCP) project with billing enabled
- **Google Cloud SDK** installed and authenticated
- Necessary permissions to create resources in the GCP project

## Usage

### Clone the Repository

```bash
git clone https://github.com/yusadolat/rns-terraform-setup.git
cd rns-terraform-setup
```

### Initialize Terraform

Initialize the Terraform working directory to download the necessary providers.

```bash
terraform init
```

### Configure Variables

Create a terraform.tfvars file in the root directory to provide values for the variables defined in variables.tf.

```bash
project_id       = "my-gcp-project-id"
region           = "us-central1"
db_password      = "my-example-db-password"
image            = "gcr.io/your-gcp-project/your-container-image:tag"
service_name     = "rns-cloud-run-service"
db_instance_name = "rns-db-instance"
cidr_block       = "10.0.0.0/16"
```

### Plan and Apply the Configuration


It’s a good practice to run terraform plan to see what resources will be created.

```bash
terraform plan
```

Review the output to ensure that the resources to be created match your expectations.

#### Apply

Apply the Terraform configuration to create the resources.

```bash
terraform apply
```

When prompted, type yes to confirm the creation of resources.

#### Outputs

After successful deployment, Terraform will output:

- cloud_run_url: The URL of the deployed Cloud Run service.
- load_balancer_ip: The external IP address of the load balancer.

You can access the application using the load_balancer_ip.

### Cleanup

To remove all resources created by this configuration, run:

```bash
terraform destroy
```

Confirm the destruction by typing yes when prompted.
