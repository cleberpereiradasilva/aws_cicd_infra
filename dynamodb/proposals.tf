resource "aws_dynamodb_table" "proposals" {
  name         = "${terraform.workspace}-proposals"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "insurer_id"
    type = "S"
  }

  attribute {
    name = "client_id"
    type = "S"
  }

  attribute {
    name = "created_at"
    type = "S"
  }

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

