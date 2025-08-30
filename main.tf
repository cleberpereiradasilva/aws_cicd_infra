terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "meu-terraform-states"
    key            = "dynamodb/terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = terraform.workspace == "prd" ? var.aws_prd_region : var.aws_dev_region
}



