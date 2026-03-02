variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "devops-assignment-gcp-488910"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-south1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}