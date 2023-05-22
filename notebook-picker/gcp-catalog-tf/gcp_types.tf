variable "gpu_types" {
  type = list(object({
    name = string
    quantity = number
    possible_quantities = list(number)
    cost_per_hour = number
  }))

  default = [
    {
      name = "NVIDIA_TESLA_T4"
      quantity = 1
      possible_quantities = [1]
      cost_per_hour = 0.06
    },
    {
      name = "NVIDIA_TESLA_P4"
      quantity = 1
      possible_quantities = [1]
      cost_per_hour = 0.10
    },
    {
      name = "NVIDIA_TESLA_V100"
      quantity = 1
      possible_quantities = [1]
      cost_per_hour = 0.20
    },
    {
      name = "NVIDIA_TESLA_A100"
      quantity = 1
      possible_quantities = [1]
      cost_per_hour = 0.40
    },
    {
      name = "NVIDIA_TESLA_K80"
      quantity = 2
      possible_quantities = [1, 2]
      cost_per_hour = 0.96
    },
    {
      name = "NVIDIA_TESLA_P100"
      quantity = 4
      possible_quantities = [1, 2, 4]
      cost_per_hour = 1.92
    },
  ]
}