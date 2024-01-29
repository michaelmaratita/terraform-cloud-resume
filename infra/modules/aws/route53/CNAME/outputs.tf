output "name" {
  description = "The name of the record."
  value = aws_route53_record.record.name
}

output "fqdn" {
  description = "FQDN built using the zone domain and name."
  value = aws_route53_record.record.fqdn
}

output "type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  value = aws_route53_record.record.type
}

output "ttl" {
  description = "The TTL of the record."
  value = aws_route53_record.record.ttl
}

output "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  value = aws_route53_record.record.zone_id
}