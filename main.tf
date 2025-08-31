terraform {
  backend "s3" {}
}

module "dynamodb" {
  source = "./dynamodb"
  stage  = var.stage
  aws_region = var.aws_region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  s3_bucket = var.s3_bucket
}


module "documents_bucket" {
  source         = "./bucket"
  stage          = var.stage
  aws_region     = var.aws_region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  bucket_suffix  = var.bucket_suffix
}

module "cloudfront" {
  source         = "./cloudfront"
  stage          = var.stage
  aws_region     = var.aws_region
  bucket_name    = module.documents_bucket.bucket_name
  bucket_arn     = module.documents_bucket.bucket_arn
}
