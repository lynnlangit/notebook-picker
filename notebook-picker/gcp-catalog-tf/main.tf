terraform {
  required_providers {
    google = "~> 3.70.0"
  }

  provider google {
    project = var.project_id
    region = var.location
  }

  variables {
    project_id = "genomics-compute"
    location = "us-central1"

    import_variables = ["machine_types.tf", "gcp_types.tf"]
    machine_type = var.machine_types[var.machine_type]
    gpu_type = var.gpu_types[var.gpu_type]
    gpu_count = var.gpu_count

  }

  resources {
    notebook_instance {
      name = "my-notebook-instance"
      machine_type = var.machine_type
      gpu_type = var.gpu_type
      gpu_count = var.gpu_count
    }

    machine_type_dropdown {
      name = "machine_type_dropdown"
      options = var.machine_types
    }

    gpu_type_dropdown {
      name = "gpu_type_dropdown"
      options = var.gpu_types
    }
  }

  outputs {
    notebook_instance_name = notebook_instance.name
    machine_type_dropdown_name = machine_type_dropdown.name
    gpu_type_dropdown_name = gpu_type_dropdown.name
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
