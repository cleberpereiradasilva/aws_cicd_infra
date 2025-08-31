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
    Project     = "Insurance Project"
  }
}

