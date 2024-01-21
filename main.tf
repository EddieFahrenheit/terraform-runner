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
  project = "esoteric-cab-411900"
  region  = "us-central1"
}

# A resource block corresponds to a product in the cloud
# Args: a product type ("google_storage_bucket") and custom name ("demo-bucket").
resource "google_storage_bucket" "demo-bucket" {
  name          = "esoteric-cab-411900"
  location      = "US"
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