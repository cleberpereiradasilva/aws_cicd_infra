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

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "bucket_suffix" {
  description = "Unique suffix for all S3 buckets"
  type        = string
}


