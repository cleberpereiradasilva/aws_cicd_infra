resource "aws_dynamodb_table" "clients" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  name           = "${local.prefix}Clients_${var.version}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"

  attribute {
    name = "ID"
    type = "S"
  }

  dynamic "attribute" {
    for_each = [ { name="CNPJ", type="S" } ]
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  global_secondary_index {
    name               = "${local.prefix}Clients_${var.version}-CNPJIndex"
    hash_key           = "CNPJ"
    projection_type    = "ALL"
  }

  lifecycle {
    prevent_destroy = var.stage == "prd"
  }

  tags = {
    Environment = var.stage
    Project     = "MyProject"
    Version     = var.version
  }
}

