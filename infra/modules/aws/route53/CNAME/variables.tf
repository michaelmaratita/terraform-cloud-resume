variable "name" {
  description = "Name for Route53 CNAME Record. e.g. blog.example.com"
  type = string
}

variable "records_list" {
  description = "(Required for non-alias records) A string list of records. e.g ['hasnode.network']"
  type = string
  nullable = true
}

variable "ttl" {
  description = "Time To Live value for DNS record"
  default = 30
  type = number
}

variable "type" {
  description = "Type of DNS record"
  default = "A"
  type = string
}

variable "zone_id" {
  description = "Passed value from data.aws_route53_zone.my_domain.zone_id"
  type = string
}