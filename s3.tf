# S3 bucket for CDK assets. Uses stage-based provider and bucket name variables.
resource "aws_s3_bucket" "cdk_assets" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  bucket   = var.stage == "prd" ? var.aws_cdk_prd_s3 : var.aws_cdk_dev_s3

  # Optional safety: set to true if you want to allow terraform destroy to remove non-empty buckets.
  # force_destroy = true
}

# With AWS provider v5, ACLs are managed via separate resources.
resource "aws_s3_bucket_ownership_controls" "cdk_assets" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  bucket   = aws_s3_bucket.cdk_assets.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "cdk_assets" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  bucket   = aws_s3_bucket.cdk_assets.id
  acl      = "private"

  depends_on = [aws_s3_bucket_ownership_controls.cdk_assets]
}
