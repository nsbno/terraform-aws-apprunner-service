provider "aws" {
  region = "eu-west-1"
}

locals {
  name_prefix      = "example"
  application_name = "vpc"
}

data "aws_ecr_repository" "ecr" {
  name = "${local.name_prefix}-${local.application_name}"
}

data "aws_vpc" "main" {
  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  tags = {
    Tier = "Private"
  }
}

module "service" {
  source = "../.."

  name_prefix = local.name_prefix

  ecr_arn = data.aws_ecr_repository.ecr.arn
  ecr_url = data.aws_ecr_repository.ecr.repository_url

  vpc_config = {
    subnet_ids      = [data.aws_subnets.private.ids]
    security_groups = ["sg-1234"]
  }

  domain_name = {
    name = "vpc.example.com"
    zone = "example.com"
  }

  tags = {
    environment = "example"
  }
}
