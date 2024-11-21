
tags = {
  environment = "staging"
  product     = "spectatr"
  owner       = "devops"
}

cloudfront_default_certificate = true
comment                        = "Staging Cloudfront for fc-glacier-dev bucket"

s3_origin_config = [
  {
    domain_name                       = "fc-glacier-dev.s3.ap-south-1.amazonaws.com"
    origin_id                         = "fc-glacier-dev"
    origin_path                       = ""
    origin_access_identity_attachment = true
  }
]

allowed_methods          = ["GET", "HEAD"]
enable                   = true
is_ipv6_enabled          = false
http_version             = "http2"
iam_certificate_id       = null
minimum_protocol_version = "TLSv1.2_2021"
price_class              = "PriceClass_All"
restriction_location     = null
restriction_type         = "none"
retain_on_delete         = false
ssl_support_method       = "sni-only"
wait_for_deployment      = true
viewer_protocol_policy   = "allow-all"
forward_query_string     = false
target_origin_id         = "fc-glacier-dev"