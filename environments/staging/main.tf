provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

output "vpc_id" {
  description = "ID of the staging VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "IPv4 CIDR block of the development VPC"
  value       = module.vpc.vpc_cidr
}