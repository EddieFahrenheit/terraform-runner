# HCL (HashiCorp Configuration Language) is a configuration language built by HashiCorp.
# Terraform is like a human readable blueprint that automates everything in multiple cloud providers

# Global settings
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }
  }
}

# Credentials to each cloud provider go below
provider "google" {
  # export GOOGLE_CREDENTIALS=keys/terraform-runner_key.json
  credentials = file(var.credentials)
  project     = var.project
  region      = var.location
}

# A resource block corresponds to a product in the cloud
# Args: a product type ("google_storage_bucket") and custom name ("demo-bucket").
resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      # Age of the object in days.
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}