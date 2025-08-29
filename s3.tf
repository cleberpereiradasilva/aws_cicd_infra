resource "aws_s3_bucket" "cdk_assets" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  bucket   = var.stage == "prd" ? var.aws_cdk_prd_s3 : var.aws_cdk_dev_s3
  acl      = "private"

  versioning {
    enabled = true
  }
}

