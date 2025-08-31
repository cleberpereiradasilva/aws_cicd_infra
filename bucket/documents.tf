resource "aws_s3_bucket" "documents" {
  bucket = "${terraform.workspace}-insurance-documents-${var.bucket_suffix}"

  tags = {
    Environment = terraform.workspace
    Project     = "Insurance Project"
  }
}

