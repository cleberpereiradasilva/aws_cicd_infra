resource "aws_dynamodb_table" "proposals" {
  name         = "${terraform.workspace}-proposals"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  # Index para pesquisar por client_id
  global_secondary_index {
    name            = "${terraform.workspace}-proposals-client-id-index"
    hash_key        = "client_id"
    projection_type = "ALL"
  }

  attribute {
    name = "client_id"
    type = "S"
  }

  # Index para pesquisar por insurer_id
  global_secondary_index {
    name            = "${terraform.workspace}-proposals-insurer-id-index"
    hash_key        = "insurer_id"
    projection_type = "ALL"
  }

  attribute {
    name = "insurer_id"
    type = "S"
  }

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}


