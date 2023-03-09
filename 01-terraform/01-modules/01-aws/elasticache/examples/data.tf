data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-states-bucket"
    key    = "account-id/region-id/environment/vpc/terraform.tfstate"
    region = var.region
  }
}

data "aws_availability_zones" "all" {
  all_availability_zones = true
  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}