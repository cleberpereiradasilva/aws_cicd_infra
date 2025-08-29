# DynamoDB table 'Clients' with a GSI on CNPJ. Adjust keys/attributes to your real schema.
resource "aws_dynamodb_table" "clients" {
  provider         = var.stage == "prd" ? aws.prd : aws.dev
  name             = "${var.stage}-Clients_${var.version}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "id"

  # Primary key attribute
  attribute {
    name = "id"
    type = "S"
  }

  # Attribute for the GSI
  attribute {
    name = "CNPJ"
    type = "S"
  }

  global_secondary_index {
    name            = "${var.stage}-Clients_${var.version}-CNPJIndex"
    hash_key        = "CNPJ"
    projection_type = "ALL"
  }

  tags = {
    Environment = var.stage
    Project     = "MyProject"
    Version     = var.version
  }
}
