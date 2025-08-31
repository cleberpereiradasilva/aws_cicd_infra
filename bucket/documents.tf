resource "aws_s3_bucket" "documents" {
  bucket = "${terraform.workspace}-insurance-documents-${var.bucket_suffix}"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

resource "aws_s3_bucket_public_access_block" "documents_block" {
  bucket = aws_s3_bucket.documents.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "documents_ownership" {
  bucket = aws_s3_bucket.documents.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}


