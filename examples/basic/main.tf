terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "service_accounts" {
  source = "../.."

  project_id = var.project_id

  accounts = {
    "app" = {
      display_name = "Application service account"
    }
  }

  project_roles = {
    "app|roles/storage.objectViewer" = "roles/storage.objectViewer"
  }
}

variable "project_id" {
  description = "Project ID to create the example service accounts in."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "service_account_emails" {
  value = module.service_accounts.emails
}
