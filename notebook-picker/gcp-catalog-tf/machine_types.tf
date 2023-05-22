variable "machine_types" {
  type = list(object({
    name = string
    gpu_types = list(string)
    gpu_quantity = list(number)
  }))

  default = [
    {
      name = "n1-standard-1"
      gpu_types = []
      gpu_quantity = []
    },
    {
      name = "n1-standard-2"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-standard-4"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-standard-8"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-standard-16"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-highmem-2"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-highmem-4"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-highmem-8"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-highmem-16"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "n1-highmem-32"
      gpu_types = ["NVIDIA_TESLA_T4"]
      gpu_quantity = [1]
    },
    {
      name = "a2-highgpu-2"
      gpu_types = ["NVIDIA_TESLA_V100"]
      gpu_quantity = [1]
    },
    {
      name = "a2-highgpu-4"
      gpu_types = ["NVIDIA_TESLA_V100"]
      gpu_quantity = [1]
    },
    {
      name = "a2-highgpu-8"
      gpu_types = ["NVIDIA_TESLA_V100"]
      gpu_quantity = [1]
    },
    {
      name = "a2-highgpu-16"
      gpu_types = ["NVIDIA_TESLA_V100"]
      gpu_quantity = [1]
    },
  ]
}

