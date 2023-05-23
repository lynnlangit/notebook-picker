variable "project" {
  default     = "genomics-compute"
  description = "name of the project to deploy to"
  type        = string

  validation {
    condition     = length(var.project) > 0
    error_message = "This application requires a project name."
  }
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "machine_type" {
  description = "Machine type to use for the notebook instance"
  type        = string
  default     = "n1-standard-1"

  validation {
    # validate that the machine_type is one of the allowed values from the list of machine_types
    condition     = contains([
        "n1-standard-1", 
        "n1-standard-2", 
        "n1-standard-4", 
        "n1-standard-8", 
        "n1-standard-16", 
        "n1-standard-32", 
        "n1-standard-64", 
        "n1-standard-96"], var.machine_type)
    error_message = "This application requires a valid machine type."
  }
}