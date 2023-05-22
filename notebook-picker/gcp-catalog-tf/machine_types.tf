variable "machine_types" {
  type = list(object({
    name = string
    accelerator_types = list(string)
    accelerator_quantity = list(number)
  }))

  default = [
    {
      name = "n1-standard-1"
      accelerator_types = []
      accelerator_quantity = []
    },
    {
      name = "n1-standard-2"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-standard-4"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-standard-8"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-standard-16"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-highmem-2"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-highmem-4"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-highmem-8"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-highmem-16"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "n1-highmem-32"
      accelerator_types = ["NVIDIA_TESLA_T4"]
      accelerator_quantity = [1]
    },
    {
      name = "a2-highgpu-2"
      accelerator_types = ["NVIDIA_TESLA_V100"]
      accelerator_quantity = [1]
    },
    {
      name = "a2-highgpu-4"
      accelerator_types = ["NVIDIA_TESLA_V100"]
      accelerator_quantity = [1]
    },
    {
      name = "a2-highgpu-8"
      accelerator_types = ["NVIDIA_TESLA_V100"]
      accelerator_quantity = [1]
    },
    {
      name = "a2-highgpu-16"
      accelerator_types = ["NVIDIA_TESLA_V100"]
      accelerator_quantity = [1]
    },
  ]
}

