data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = data.aws_availability_zones.available.names
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "trainee-uladzimir-boki-vpc"

  cidr = "10.0.0.0/16"

  azs = local.azs

  public_subnets  = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet("10.0.0.0/16", 8, k + 128)]
}