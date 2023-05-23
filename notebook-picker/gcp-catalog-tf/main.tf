terraform {
  required_providers {
    google = "~> 3.70.0"
  }
}

provider google {
  
  # locally use 'gcloud auth application-default login' to authenticate  
  # credentials = file("<NAME>.json")

  project = var.project
  region  = var.region
  zone    = var.zone
}

variable "machine_types" {
  type = map(string)
  default = {
    "n1-standard-1" = "n1-standard-1"
    "n1-highmem" = "n1-highmem"
  }
}

variable "gpu_types" {
  type = map(string)
  default = {
    "nvidia-tesla-t4" = "nvidia-tesla-t4"
    "nvidia-tesla-p4" = "nvidia-tesla-p4"
  }
}

resource "google_compute_machine_type" "all_n1_standard" {
  name = "n1-standard-1"
}

resource "google_compute_machine_type" "all_n1_highmem" {
  name = "n1-highmem"
}

output "all_n1_standard_machine_types" {
  value = google_compute_machine_type.all_n1_standard.*.name
}

output "all_n1_highmem_machine_types" {
  value = google_compute_machine_type.all_n1_highmem.*.name
}

resource "google_compute_notebook_instance" "my_notebook_instance" {
  name = "my-notebook-instance"
  machine_type = var.machine_type
  gpu_type = var.gpu_type
  gpu_count = 1
}

output "notebook_instance_name" {
  value = google_compute_notebook_instance.my_notebook_instance.name
}

output "machine_type_dropdown_name" {
  value = google_compute_machine_type.all_n1_standard.name
}

output "gpu_type_dropdown_name" {
  value = google_compute_machine_type.all_n1_highmem.name
}
