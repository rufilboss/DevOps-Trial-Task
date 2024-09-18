# DevOps Trial Task | Terraform GCP DevOps Task

This repository contains Terraform code to provision the following resources in Google Cloud Platform (GCP):

- Cloud SQL (PostgreSQL) instance
- CloudRun service
- HTTP Load Balancer

## Folder Structure

- `/modules/`: Contains separate modules for CloudRun, Cloud SQL, and Load Balancer.
- `/terraform/`: Contains the main configuration files.

## Usage

1. Clone the repository.

```bash
git clone git@github.com:rufilboss/DevOps-Trial-Task.git
```

2. Update the variables in `terraform/variables.tf` with the correct project details.
3. Initialize Terraform:

```bash
terraform init
