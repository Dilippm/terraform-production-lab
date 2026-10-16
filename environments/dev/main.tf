provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}




output "vpc_id" {
  description = "ID of the development VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "IPv4 CIDR block of the development VPC"
  value       = module.vpc.vpc_cidr
}

module "security_group" {
  source = "../../modules/security-group"

  name        = "${var.environment}-app-sg"
  description = "Application security group for ${var.environment}"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment

  ingress_rules = {
    https_from_vpc = {
      description = "HTTPS from the development VPC"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = module.vpc.vpc_cidr
    }
  }

  egress_rules = {
    https_outbound = {
      description = "HTTPS outbound"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

output "security_group_id" {
  description = "ID of the development application security group"
  value       = module.security_group.security_group_id
}