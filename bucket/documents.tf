resource "aws_s3_bucket" "documents" {
  bucket = "${terraform.workspace}-insurance-documents-${var.bucket_suffix}"

  acl = "private"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }

  public_access_block {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }

}

