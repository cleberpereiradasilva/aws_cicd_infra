variable "table_name" {
  type        = string
  description = "Nome da tabela DynamoDB"
}

variable "billing_mode" {
  type        = string
  default     = "PAY_PER_REQUEST"
}

