
tags = {
  environment = "staging"
  product     = "spectatr"
  owner       = "devops"
}

cloudfront_default_certificate = true
comment                        = "Staging Cloudfront for fc-fantasy-files bucket"

s3_origin_config = [
  {
    domain_name                       = "fc-fantasy-files.s3.ap-south-1.amazonaws.com"
    origin_id                         = "fc-fantasy-files"
    origin_path                       = ""
    origin_access_identity_attachment = false
    origin_access_control_attachment  = false
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
target_origin_id         = "fc-fantasy-files"
#oac
aws_region           = "us-east-1"

oac_name             = "example-oac"
oac_description      = "OAC for accessing S3 bucket securely"
oac_origin_type      = "s3"
oac_signing_behavior = "always"
oac_signing_protocol = "sigv4"
