resource "aws_s3_bucket" "web-files" {
  bucket = "${terraform.workspace}-insurance-web-files-${var.bucket_suffix}"


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

resource "aws_s3_bucket" "web-files-backups" {
  bucket = "${terraform.workspace}-insurance-web-files-backups-${var.bucket_suffix}"

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


