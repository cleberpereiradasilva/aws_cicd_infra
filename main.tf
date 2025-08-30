terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = var.s3_bucket
    key            = "terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "stage" {
  description = "Environment stage"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "s3_bucket" {
  type = string
}

# Tabela DynamoDB de Clients
resource "aws_dynamodb_table" "clients" {
  name         = "${terraform.workspace}-clients"
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
    name            = "${terraform.workspace}-clients-CNPJIndex"
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
  value = [for gsi in aws_dynamodb_table.clients.global_secondary_index : gsi.name if gsi.name == "${terraform.workspace}-clients-CNPJIndex"][0]
}

