resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "cert1" {
  domain_name       = "example.com"
  validation_method = "DNS"
  

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
