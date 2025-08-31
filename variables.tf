variable "stage" {
  description = "Environment stage"
  type        = string
}

variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "s3_bucket" {
  type = string
}

variable "bucket_suffix" {
  type        = string
  description = "Unique suffix for all S3 buckets"
  default     = "dd8019"
}

