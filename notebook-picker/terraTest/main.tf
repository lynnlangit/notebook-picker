terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
    
  # locally use 'gcloud auth application-default login' to authenticate  
  # credentials = file("<NAME>.json")

    project = var.project
    region  = var.region
    zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
