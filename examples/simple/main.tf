provider "aws" {
  region = "eu-west-1"
}

locals {
  name_prefix      = "example"
  application_name = "simple"
}

data "aws_ecr_repository" "ecr" {
  name = "${local.name_prefix}-${local.application_name}"
}

module "service" {
  source = "../.."

  name_prefix = local.name_prefix

  ecr_arn = data.aws_ecr_repository.ecr.arn
  ecr_url = data.aws_ecr_repository.ecr.repository_url

  domain_name = {
    name = "simple.example.com"
    zone = "example.com"
  }

  tags = {
    environment = "example"
  }
}
