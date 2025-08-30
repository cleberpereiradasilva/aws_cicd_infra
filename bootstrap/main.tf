provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "stage" {}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.stage}-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


