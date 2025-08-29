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
  prefix = "${var.stage}-"
}

