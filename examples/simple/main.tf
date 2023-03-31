provider "aws" {
  region = "eu-west-1"
}

locals {
  name_prefix = "example"
  application_name = "simple"
}

module "service" {
  source = "../.."

  name_prefix = local.name_prefix

  ecr_arn = ""
  ecr_url = ""

  hosted_zone_name = ""
  host_name = ""

  tags = {
    environment = "example"
  }
}
