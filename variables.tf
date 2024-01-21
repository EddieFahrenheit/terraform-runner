variable "credentials" {
  description = "Credentials"
  default     = "keys/terraform-runner_key.json"
}

variable "project" {
  description = "Project"
  default     = "esoteric-cab-411900"
}

variable "region" {
  description = "Project region"
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}
variable "bq_dataset_name" {
  description = "BigQuery dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "The storage bucket name"
  default     = "esoteric-cab-411900"
}

variable "gcs_storage_class" {
  description = "The storage class of the bucket"
  default     = "STANDARD"
}