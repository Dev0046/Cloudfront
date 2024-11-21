output "id" {
  value       = module.cloudfront.id
  description = "The identifier for the distribution. For example: EDFDVBD632BHDS5."
}

output "arn" {
  value       = module.cloudfront.arn
  description = "The ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
}

output "caller_reference" {
  value       = module.cloudfront.caller_reference
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
}

output "status" {
  value       = module.cloudfront.status
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
}

output "trusted_signers" {
  value       = module.cloudfront.trusted_signers
  description = "The key pair IDs that CloudFront is aware of for each trusted signer, if the distribution is set up to serve private content with signed URLs."
}

output "domain_name" {
  value       = module.cloudfront.domain_name
  description = "The domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net."
}

output "last_modified_time" {
  value       = module.cloudfront.last_modified_time
  description = "The date and time the distribution was last modified."
}

output "in_progress_validation_batches" {
  value       = module.cloudfront.in_progress_validation_batches
  description = "The number of invalidation batches currently in progress."
}

output "etag" {
  value       = module.cloudfront.etag
  description = "The current version of the distribution's information. For example: E2QWRUHAPOMQZL."
}

output "hosted_zone_id" {
  value       = module.cloudfront.hosted_zone_id
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
}