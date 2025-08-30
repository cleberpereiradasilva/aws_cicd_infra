terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "cicd-cdk-dev"
    key            = "terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "sa-east-1"
}

variable "stage" {
  description = "Environment stage"
  type        = string
  default     = "dev"
}

resource "aws_dynamodb_table" "clients" {
  name         = "${terraform.workspace}-Clients"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "CNPJ"
    type = "S"
  }

  global_secondary_index {
    name            = "${terraform.workspace}-Clients-CNPJIndex"
    hash_key        = "CNPJ"
    projection_type = "ALL"
  }

  tags = {
    Environment = terraform.workspace
    Project     = "MeuApp"
  }
}

output "clients_table_name" {
  value = aws_dynamodb_table.clients.name
}

output "clients_table_cnpj_index" {
  value = aws_dynamodb_table.clients.global_secondary_indexes[0].name
}

