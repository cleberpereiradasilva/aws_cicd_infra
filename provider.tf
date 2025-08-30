provider "aws" {
  region = terraform.workspace == "prd" ? var.aws_prd_region : var.aws_dev_region
}

