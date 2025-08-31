resource "aws_s3_bucket" "web-files" {
  bucket = "${terraform.workspace}-insurance-web-files-${var.bucket_suffix}"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

resource "aws_s3_bucket" "web-files-backups" {
  bucket = "${terraform.workspace}-insurance-web-files-backups-${var.bucket_suffix}"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}


