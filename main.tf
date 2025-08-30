terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "meu-terraform-states"
    key            = "dynamodb/terraform.tfstate"
    region         = "sa-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}




