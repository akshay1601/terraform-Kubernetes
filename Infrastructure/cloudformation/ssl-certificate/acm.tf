# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"
  

#   tags = {
#     Environment = var.environment
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_acm_certificate" "cert" {
  domain_name       = "992382478305.realhandsonlabs.net"
  validation_method = "DNS"

  tags = {
    Environment = "development"
  }

  lifecycle {
    create_before_destroy = true
  }
}