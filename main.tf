terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket       = "cicd-cdk-dev"
    key          = "dynamodb/terraform.tfstate"
    region       = "sa-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

# Variável para stage
variable "stage" {
  description = "Environment stage (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

# DynamoDB Table para locks ou uso geral
resource "aws_dynamodb_table" "this" {
  name         = "terraform-locks-${var.stage}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.stage
    Terraform   = "true"
  }
}

# Output do nome da tabela
output "dynamodb_table_name" {
  value = aws_dynamodb_table.this.name
}


