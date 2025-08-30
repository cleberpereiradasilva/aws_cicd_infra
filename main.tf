module "dynamodb" {
  source = "../dynamodb"
  stage  = var.stage
  aws_region = var.aws_region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  s3_bucket = var.s3_bucket
}


