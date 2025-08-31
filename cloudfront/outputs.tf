output "cloudfront_domain_name" {
  description = "URL do CloudFront gerada automaticamente"
  value       = aws_cloudfront_distribution.this.domain_name
}

