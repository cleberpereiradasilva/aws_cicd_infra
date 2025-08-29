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

resource "aws_iam_policy" "ci_cd_policy" {
  provider = var.stage == "prd" ? aws.prd : aws.dev
  name   = "${var.stage}-ci-cd-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "*"
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  provider   = var.stage == "prd" ? aws.prd : aws.dev
  role       = aws_iam_role.ci_cd_role.name
  policy_arn = aws_iam_policy.ci_cd_policy.arn
}

