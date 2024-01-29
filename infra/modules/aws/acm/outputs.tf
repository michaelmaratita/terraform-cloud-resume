# aws_acm_certificate.cert

output "id" {
  description = "ARN of the certificate"
  value = aws_acm_certificate.cert.id
}

output "arn" {
  description = "ARN of the certificate"
  value = aws_acm_certificate.cert.arn
}

output "domain_name" {
  description = "Domain name for which the certificate is issued"
  value = aws_acm_certificate.cert.domain_name
}

output "domain_validation_options" {
  description = "Set of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g., if SANs are defined. Only set if DNS-validation was used."
  value = aws_acm_certificate.cert.domain_validation_options
}

output "not_after" {
  description = "Expiration date and time of the certificate."
  value = aws_acm_certificate.cert.not_after
}

output "not_before" {
  description = "Start of the validity period of the certificate."
  value = aws_acm_certificate.cert.not_before
}

output "pending_renewal" {
  description = "true if a Private certificate eligible for managed renewal is within the early_renewal_duration period."
  value = aws_acm_certificate.cert.pending_renewal
}

output "renewal_eligibility" {
  description = "Whether the certificate is eligible for managed renewal."
  value = aws_acm_certificate.cert.renewal_eligibility
}

output "renewal_summary" {
  description = "Contains information about the status of ACM's managed renewal for the certificate."
  value = aws_acm_certificate.cert.renewal_summary
}

output "status" {
  description = "Status of the certificate."
  value = aws_acm_certificate.cert.status
}

output "subject_alternative_names" {
  description = "(Optional) Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
  value = aws_acm_certificate.cert.subject_alternative_names
}

output "validation_method" {
  description = "(Optional) Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform."
  value = aws_acm_certificate.cert.validation_method
}

output "type" {
  description = "Source of the certificate."
  value = aws_acm_certificate.cert.type
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_acm_certificate.cert.tags_all
}

output "validation_emails" {
  description = "List of addresses that received a validation email. Only set if EMAIL validation was used."
  value = aws_acm_certificate.cert.validation_emails
}

# aws_acm_certificate_validation.cert

output "validation_certificate_arn" {
  description = "Certificate ARN for Validation certificate from ACM"
  value = aws_acm_certificate_validation.cert.certificate_arn
}

output "validation_id" {
  description = "Time at which the certificate was issued"
  value = aws_acm_certificate_validation.cert.id
}