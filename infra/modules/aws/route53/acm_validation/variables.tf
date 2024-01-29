variable "domain_validation_options" {
  description = "Passed value from aws_acm_certificate.cert for domain_validation_options"
  type = set(object({
      domain_name           = string
      resource_record_name  = string
      resource_record_type  = string
      resource_record_value = string
    }))
}

variable "zone_id" {
  description = "Passed value from data.aws_route53_zone.my_domain.zone_id"
  type = string
}

# Required for outputs.tf
variable "domain_name" {
  description = "Domain name for which the certificate is issued."
  type = string
}

variable "subject_alternative_names" {
  description = "Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
  type = string
}