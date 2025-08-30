terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "cicd-cdk-dev"                  # Bucket S3 do Terraform state
    key            = "terraform.tfstate"             # Caminho dentro do bucket
    region         = "sa-east-1"
    dynamodb_table = "terraform-locks"              # Tabela para lock distribuído
    encrypt        = true
  }
}

# Variável stage (opcional)
variable "stage" {
  description = "Environment stage"
  type        = string
  default     = "dev"
}

# Tabela DynamoDB usada para lock do Terraform
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Tabela real de clients
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

# Outputs
output "clients_table_name" {
  value = aws_dynamodb_table.clients.name
}

output "clients_table_cnpj_index" {
  value = aws_dynamodb_table.clients.global_secondary_indexes[0].name
}



