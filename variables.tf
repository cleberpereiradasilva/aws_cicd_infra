variable "stage" {
  description = "Environment stage (dev or prd)"
  type        = string
  default     = "dev"
}

variable "version" {
  description = "Version of the stack"
  type        = string
  default     = "v1"
}

variable "aws_dev_region" {}
variable "aws_dev_access_key" {}
variable "aws_dev_secret_key" {}

variable "aws_prd_region" {}
variable "aws_prd_access_key" {}
variable "aws_prd_secret_key" {}

variable "aws_cdk_dev_s3" {}
variable "aws_cdk_prd_s3" {}

