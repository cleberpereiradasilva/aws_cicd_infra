variable "stage" {
  description = "Stage (dev, prod, etc)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket S3 de origem"
  type        = string
}

