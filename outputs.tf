output "dynamodb_table_name" {
  value = aws_dynamodb_table.clients.name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.cdk_assets.bucket
}

output "ci_cd_role_arn" {
  value = aws_iam_role.ci_cd_role.arn
}
