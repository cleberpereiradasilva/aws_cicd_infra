terraform {
  required_version = ">= 1.3.0"
  backend "local" {}  # temporário, só para criar a tabela
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

