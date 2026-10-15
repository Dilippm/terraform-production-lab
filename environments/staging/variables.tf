variable "vpc_cidr" {
  description = "CIDR block for the development VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "staging"
}