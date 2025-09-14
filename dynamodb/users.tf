resource "aws_dynamodb_table" "users" {
  name         = "${terraform.workspace}-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "nome"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  # GSI para pesquisa por nome
  global_secondary_index {
    name            = "${terraform.workspace}-users-NomeIndex"
    hash_key        = "nome"
    projection_type = "ALL"
  }

  # GSI para garantir unicidade de e-mail (controlado na aplicação)
  global_secondary_index {
    name            = "${terraform.workspace}-users-EmailIndex"
    hash_key        = "email"
    projection_type = "ALL"
  }

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

