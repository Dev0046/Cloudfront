# Check if the cache policy already exists by name
data "aws_cloudfront_cache_policy" "existing_policy" {
  name = "S3-Caching"
}

# Create the cache policy only if it doesn't already exist
resource "aws_cloudfront_cache_policy" "s3_caching_policy" {
  count   = length(data.aws_cloudfront_cache_policy.existing_policy.id) == 0 ? 1 : 0
  name    = "S3-Caching"
  comment = "All other S3 objects except website objects"

  default_ttl = 604800   # Default TTL in seconds
  max_ttl     = 31536000 # Maximum TTL in seconds
  min_ttl     = 604800   # Minimum TTL in seconds

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }

    enable_accept_encoding_gzip   = true
    enable_accept_encoding_brotli = true
  }
}

module "cloudfront" {
  source = "../../../tfmodules/cloudfront"

  acm_certificate_arn            = var.acm_certificate_arn
  tags                           = var.tags
  alias                          = var.alias
  cloudfront_default_certificate = var.cloudfront_default_certificate
  comment                        = var.comment
  default_root_object            = var.default_root_object
  custom_error_response          = var.custom_error_response
  custom_origin_config           = var.custom_origin_config
  ordered_cache_behavior         = var.ordered_cache_behavior
  origin_group                   = var.origin_group
  logging_config                 = var.logging_config
  s3_origin_config               = var.s3_origin_config
  enable                         = var.enable
  is_ipv6_enabled                = var.is_ipv6_enabled
  http_version                   = var.http_version
  iam_certificate_id             = var.iam_certificate_id
  minimum_protocol_version       = var.minimum_protocol_version
  price_class                    = var.price_class
  restriction_location           = var.restriction_location
  restriction_type               = var.restriction_type
  retain_on_delete               = var.retain_on_delete
  ssl_support_method             = var.ssl_support_method
  wait_for_deployment            = var.wait_for_deployment
  web_acl_id                     = var.web_acl_id
  allowed_methods                = var.allowed_methods
  cached_methods                 = var.cached_methods
  cache_policy_id                = length(data.aws_cloudfront_cache_policy.existing_policy.id) > 0 ? data.aws_cloudfront_cache_policy.existing_policy.id : aws_cloudfront_cache_policy.s3_caching_policy[0].id
  default_ttl                    = var.default_ttl
  min_ttl                        = var.min_ttl
  max_ttl                        = var.max_ttl
  trusted_signers                = var.trusted_signers
  trusted_key_groups             = var.trusted_key_groups
  compress                       = var.compress
  viewer_protocol_policy         = var.viewer_protocol_policy
  realtime_log_config_arn        = var.realtime_log_config_arn
  lambda_function_association    = var.lambda_function_association
  function_association           = var.function_association
  forward_query_string           = var.forward_query_string
  query_string_cache_keys        = var.query_string_cache_keys
  forward_cookies                = var.forward_cookies
  forward_header_values          = var.forward_header_values
  target_origin_id               = var.target_origin_id
  #oac
  
  oac_name              = var.oac_name
  oac_description       = var.oac_description
  oac_origin_type       = var.oac_origin_type
  oac_signing_behavior  = var.oac_signing_behavior
  oac_signing_protocol  = var.oac_signing_protocol
}
