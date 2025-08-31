resource "aws_s3_bucket" "web-files" {
  bucket = "${terraform.workspace}-insurance-web-files-${var.bucket_suffix}"
  acl    = "private"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

resource "aws_s3_bucket_public_access_block" "web_files_block" {
  bucket = aws_s3_bucket.web-files.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "web-files-backups" {
  bucket = "${terraform.workspace}-insurance-web-files-backups-${var.bucket_suffix}"
  acl    = "private"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

resource "aws_s3_bucket_public_access_block" "web_files_backups_block" {
  bucket = aws_s3_bucket.web-files-backups.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


