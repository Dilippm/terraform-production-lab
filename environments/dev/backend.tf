terraform {
  backend "s3" {
    bucket       = "terraform-production-lab-state-484907528737-ap-south-1"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}