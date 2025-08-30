variable "aws_prd_region" {
  description = "Região AWS para produção"
  default     = "sa-east-1"
}

variable "aws_dev_region" {
  description = "Região AWS para desenvolvimento"
  default     = "sa-east-1"
}

variable "table_name" {
  description = "Nome da tabela DynamoDB"
  type        = string
}

variable "billing_mode" {
  description = "Modo de cobrança do DynamoDB"
  type        = string
  default     = "PAY_PER_REQUEST"
}



