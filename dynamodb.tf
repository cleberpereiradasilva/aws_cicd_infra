variable "stage" {
  type    = string
  default = "dev"
}

provider "aws" {
  alias  = "dev"
  region = var.stage == "dev" ? "sa-east-1" : ""
}

provider "aws" {
  alias  = "prd"
  region = var.stage == "prd" ? "sa-east-1" : ""
}

resource "aws_dynamodb_table" "clients_dev" {
  provider = aws.dev
  count    = var.stage == "dev" ? 1 : 0

  name           = "dev-Clients_v1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"
  attribute {
    name = "ID"
    type = "S"
  }
  global_secondary_index {
    name               = "dev-Clients_v1-CNPJIndex"
    hash_key           = "CNPJ"
    projection_type    = "ALL"
  }
  tags = {
    Environment = "dev"
    Project     = "MyProject"
    Version     = "v1"
  }
}

resource "aws_dynamodb_table" "clients_prd" {
  provider = aws.prd
  count    = var.stage == "prd" ? 1 : 0

  name           = "prd-Clients_v1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"
  attribute {
    name = "ID"
    type = "S"
  }
  global_secondary_index {
    name               = "prd-Clients_v1-CNPJIndex"
    hash_key           = "CNPJ"
    projection_type    = "ALL"
  }
  tags = {
    Environment = "prd"
    Project     = "MyProject"
    Version     = "v1"
  }
}



