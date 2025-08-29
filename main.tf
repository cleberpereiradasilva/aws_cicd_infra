terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Providers are declared once here. Selection per-stage is done in each resource via a conditional.
provider "aws" {
  alias      = "dev"
  region     = var.aws_dev_region
  access_key = var.aws_dev_access_key
  secret_key = var.aws_dev_secret_key
}

provider "aws" {
  alias      = "prd"
  region     = var.aws_prd_region
  access_key = var.aws_prd_access_key
  secret_key = var.aws_prd_secret_key
}

locals {
  prefix      = "${var.stage}-"
  is_prd      = var.stage == "prd"
  stack_label = "${var.stage}-v${var.version}"
}
