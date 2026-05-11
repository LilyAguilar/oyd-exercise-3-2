variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "name" {
  description = "The name of the Lambda function and associated resources"
  type        = string
}

variable "memory_size" {
  description = "Amount of memory in MB the Lambda Function can use at runtime"
  type        = number
  default     = 128
}

variable "architectures" {
  description = "Instruction set architecture for the Lambda function."
  type        = list(string)
  default     = ["arm64"]
}
