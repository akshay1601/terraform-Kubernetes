resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  subject_alternative_names = var.subject_alternative_names

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
