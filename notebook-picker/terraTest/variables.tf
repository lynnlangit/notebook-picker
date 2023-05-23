variable "project" {
  default     = "genomics-compute"
  description = "name of the project to deploy to"
  type        = string

  validation {
    condition     = length(var.project) > 0
    error_message = "This application requires a valid GCP project name."
  }
}

variable "region" {
  default = "us-central1"
  description = "value of the region to deploy to"  
}

variable "zone" {
  default = "us-central1-c"
  description = "value"
}

variable "machine_type" {
  default     = "n1-standard-1"
  description = "Machine type to use for the notebook instance"
  type        = string
  
  validation {
    # validate that the machine_type is one of the allowed values 
    # for VertexAI managed notebooks

    condition = contains([
        "n1-standard-1", 
        "n1-standard-2", 
        "n1-standard-4", 
        "n1-standard-8", 
        "n1-standard-16", 
        "n1-standard-32", 
        "n1-standard-64", 
        "n1-standard-96",
        "n1-highmem-2", 
        "n1-highmem-4", 
        "n1-highmem-8", 
        "n1-highmem-16", 
        "n1-highmem-32", 
        "n1-highmem-64", 
        "n1-highmem-96",
        "a2-highgpu-1g", 
        "a2-highgpu-2g", 
        "a2-highgpu-4g", 
        "a2-highgpu-8g"
        ], var.machine_type)
    error_message = "Vertex AI managed notebooks requires a valid machine type."
  }
}