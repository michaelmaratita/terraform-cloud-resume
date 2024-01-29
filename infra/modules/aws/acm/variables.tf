variable "domain_name" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}

variable "subject_alternative_names" {
  description = "(Optional) Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
  type = list(string)
  default = [ ]
}

variable "validation_method" {
  description = "(Optional) Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform."
  type = string
  default = "DNS"
}

variable "validation_record" {
  type = list(string)
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type = map(string)
  default = {
    "Enivronment" = "Production",
    "Terraform"   = true
  }
}