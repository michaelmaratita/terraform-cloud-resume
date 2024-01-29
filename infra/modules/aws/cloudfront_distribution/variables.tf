# aws_cloudfront_origin_access_contol.default
variable "name" {
  description = "(Required) A name that identifies the Origin Access Control."
  type = string
}

variable "description" {
  description = "(Optional) The description of the Origin Access Control. Defaults to \"Managed by Terraform\" if omitted."
  type = string
}

variable "origin_access_control_origin_type" {
  description = "(Required) The type of origin that this Origin Access Control is for. Valid values are s3, and mediastore."
  type = string
  default = "s3"
}

variable "signing_behavior" {
  description = "(Required) Specifies which requests CloudFront signs. Specify always for the most common use case. Allowed values: always, never, and no-override."
  type = string
  default = "always"
}

variable "signing_protocol" {
  description = "Required) Determines how CloudFront signs (authenticates) requests. The only valid value is sigv4."
  type = string
  default = "sigv4"
}

# aws_cloudfront_distribution.s3_distribution
variable "comment" {
  description = "(Optional) - Any comments you want to include about the distribution."
  type = string
}

variable "bucket_regional_domain_name" {
  description = "Regional Domain Name for S3 Bucket"
  type = string
}

variable "cdn_alias" {
  description = "The name of the custom domain associated with Route53 and CloudFront"
  type = string
}

variable "default_root_object" {
  description = "(Optional) - Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type = string
  default = "index.html"
}

variable "allowed_methods" {
  description = "(Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type = list(string)
  default = [ "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT" ]
}

variable "cached_methods" {
  description = "(Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  type = list(string)
  default = [ "GET", "HEAD" ]
}

variable "origin_id" {
  description = "Origin Access Control ID Value"
  type = string
}

variable "valid_certificate_arn" {
  description = "Certificate ARN for Validation certificate from ACM"
  type = string
}

variable "query_string" {
  description = "(Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
  type = bool
  default = false
}

variable "cookies_forward" {
  description = "(Required) - The forwarded values cookies that specifies how CloudFront handles cookies (maximum one)."
  type = string
  default = "none"
}

variable "viewer_protocol_policy" {
  description = "(Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
  type = string
  default = "redirect-to-https"
}

variable "min_ttl" {
  description = "(Optional) - Minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds."
  type = number
  default = 0
}

variable "default_ttl" {
  description = "(Optional) - Default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
  type = number
  default = 3600
}

variable "max_ttl" {
  description = "(Optional) - Maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers."
  type = number
  default = 84600
}

variable "price_class" {
  description = "(Optional) - Price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."
  type = string
  default = "PriceClass_200"
}

variable "restriction_type" {
  description = "(Required) - Method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist"
  type = string
  default = "none"
}

variable "locations" {
  description = "(Required) - ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist). If the type is specified as none an empty array can be used."
  type = list(string)
  default = []
}

variable "ssl_support_method" {
  description = "How you want CloudFront to serve HTTPS requests. One of vip, sni-only, or static-ip. Required if you specify acm_certificate_arn or iam_certificate_id. NOTE: vip causes CloudFront to use a dedicated IP address and may incur extra charges."
  type = string
  default = "sni-only"
}

variable "minimum_protocol_version" {
  description = "Minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. Can only be set if cloudfront_default_certificate = false. See all possible values in this table under \"Security policy.\" Some examples include: TLSv1.2_2019 and TLSv1.2_2021. Default: TLSv1. NOTE: If you are using a custom certificate (specified with acm_certificate_arn or iam_certificate_id), and have specified sni-only in ssl_support_method, TLSv1 or later must be specified. If you have specified vip in ssl_support_method, only SSLv3 or TLSv1 can be specified. If you have specified cloudfront_default_certificate, TLSv1 must be specified."
  type = string
  default = "TLSv1.2_2021"
}

