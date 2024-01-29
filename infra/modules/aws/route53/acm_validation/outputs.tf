output "domain_name" {
  description = "DNS Record validation"
  value = "${aws_route53_record.validation[var.domain_name].fqdn}"
}

output "subject_alternative_names" {
  description = "DNS Record validation"
  value = "${aws_route53_record.validation[var.subject_alternative_names].fqdn}"
}