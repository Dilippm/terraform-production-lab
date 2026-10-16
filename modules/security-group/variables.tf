variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Purpose of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the security group belongs"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "ingress_rules" {
  description = "Inbound rules keyed by stable rule names"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
  }))
  default = {}
}

variable "egress_rules" {
  description = "Outbound rules keyed by stable rule names"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    cidr_ipv4   = string
  }))
  default = {}
}