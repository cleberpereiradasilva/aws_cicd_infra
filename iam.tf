# Single role whose name varies by stage. Extend with policies as needed.
resource "aws_iam_role" "ci_cd_role" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  name     = "${var.stage}-ci-cd-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Example inline policy attachment (customize to your needs)
# resource "aws_iam_role_policy" "ci_cd_inline" {
#   provider = var.stage == "prd" ? aws.prd : aws.dev
#   name     = "${var.stage}-ci-cd-inline"
#   role     = aws_iam_role.ci_cd_role.id
#   policy   = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect = "Allow"
#       Action = ["s3:*", "dynamodb:*"]
#       Resource = "*"
#     }]
#   })
# }
