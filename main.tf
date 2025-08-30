terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "cicd-cdk-dev"
    key            = "dynamodb/terraform.tfstate"
    region         = "sa-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}

module "dynamodb" {
  source = "./dynamodb"
  # passe variáveis do módulo, se houver
}



