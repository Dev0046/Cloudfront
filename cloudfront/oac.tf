locals {
  origin_access_control = aws_cloudfront_origin_access_control.oac.id
  # origin_id              = aws_cloudfront_origin_access_control.oac.id
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = var.oac_name
  description                       = var.oac_description
  origin_access_control_origin_type = var.oac_origin_type
  signing_behavior                  = var.oac_signing_behavior
  signing_protocol                  = var.oac_signing_protocol
}

