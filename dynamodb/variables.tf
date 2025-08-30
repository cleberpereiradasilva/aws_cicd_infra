variable "stage" {
  description = "Environment stage"
  type        = string
  default     = "dev"
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

