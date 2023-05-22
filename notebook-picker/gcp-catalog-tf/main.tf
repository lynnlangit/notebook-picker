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

    # Import variables from machine_types.tf
    import_variables "machine_types"

    machine_type = var.machine_types[var.machine_type]
    accelerator_type = var.gpu_types[var.accelerator_type]
    accelerator_count = var.accelerator_count

  }

  resources {
    notebook_instance {
      name = "my-notebook-instance"
      machine_type = var.machine_type
      accelerator_type = var.accelerator_type
      accelerator_count = var.accelerator_count
    }

    machine_type_dropdown {
      name = "machine_type_dropdown"
      options = var.machine_types
    }

    accelerator_type_dropdown {
      name = "accelerator_type_dropdown"
      options = var.gpu_types
    }
  }

  outputs {
    notebook_instance_name = notebook_instance.name
    machine_type_dropdown_name = machine_type_dropdown.name
    accelerator_type_dropdown_name = accelerator_type_dropdown.name
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
