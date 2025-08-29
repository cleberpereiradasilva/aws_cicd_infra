variable "stage" {
  description = "Environment stage (dev or prd)"
  type        = string
  default     = "dev"
}

variable "version" {
  description = "Version of the stack (string, e.g. 1)"
  type        = string
  default     = "1"
}

variable "aws_dev_region"      { type = string }
variable "aws_dev_access_key"  { type = string }
variable "aws_dev_secret_key"  { type = string }

variable "aws_prd_region"      { type = string }
variable "aws_prd_access_key"  { type = string }
variable "aws_prd_secret_key"  { type = string }

variable "aws_cdk_dev_s3" {
  description = "Pre-existing S3 bucket name for dev (must be globally unique)"
  type        = string
}

variable "aws_cdk_prd_s3" {
  description = "Pre-existing S3 bucket name for prd (must be globally unique)"
  type        = string
}
