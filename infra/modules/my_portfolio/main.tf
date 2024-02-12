locals {
  mime_types = jsondecode(file("${path.module}/mime.json"))
}

# AWS Certificate Manager (ACM)
module "acm" {
  source = "../aws/acm"

  domain_name         = var.my_domain
  subject_alternative_names = [var.subject_alternative_names]
  validation_record   = [ 
    module.acm_validation.domain_name,
    module.acm_validation.subject_alternative_names
  ]
}

module "acm_validation" {
  source = "../aws/route53/acm_validation"

  domain_validation_options = module.acm.domain_validation_options
  zone_id                   = data.aws_route53_zone.my_domain.zone_id
  domain_name               = var.my_domain
  subject_alternative_names = var.subject_alternative_names
}

# AWS API Gateway
module "api" {
  source = "../aws/api_gateway"

  name = var.api_name
  description = var.api_description
  types = var.api_types
}

module "api_deployment" {
  source = "../aws/api_gateway/api_gateway_deployment"

  api_id = module.api.id
  redeployment = [
    module.api_resource_dynamodb.integration_response,
    module.api_resource_dynamodb.method,
    module.api_resource_dynamodb.integration,
    module.api_resource_dynamodb.api_resource,
    module.api_resource_sns.integration_response,
    module.api_resource_sns.method,
    module.api_resource_sns.integration,
    module.api_resource_sns.api_resource
    ]
  stage_name = "Production"
  domain_name = module.api_gateway_domain.domain_name
}

module "api_gateway_domain" {
  source = "../aws/api_gateway/api_gateway_domain"

  certificate_arn = module.acm.validation_certificate_arn
  domain_name     = var.api_domain_name
}

module "api_resource_dynamodb" {
  source = "../API_resource_with_CORS"

  api_id                    = module.api.id
  parent_id                 = module.api.root_resource_id
  path_part                 = var.dynamodb_path_part
  http_method               = var.http_method
  lambda_function           = module.lambda_dynamodb.invoke_arn
}

module "api_resource_sns" {
  source = "../API_resource_with_CORS"

  api_id                    = module.api.id
  parent_id                 = module.api.root_resource_id
  path_part                 = var.sns_path_part
  http_method               = var.http_method
  lambda_function           = module.lambda_sns.invoke_arn
}

# CloudFront Distribution with S3 Bucket
module "static_website" {
  source = "../s3_cloudfront_site"

  name              = var.origin_access_name
  description       = var.origin_access_description
  comment           = var.cloudfront_comment
  domain_name       = var.my_domain
  origin_id         = var.origin_id
  bucket_name       = var.bucket_name
  bucket_policy_sid = var.bucket_policy_sid
  certificate       = module.acm.validation_certificate_arn
}

# DynamoDB Table 
module "dynamodb" {
  source = "../dynamodb_table"

  table_name     = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  type           = var.type
  attribute      = var.attribute
  environment    = var.environment
  table_item     = var.table_item
}

# AWS Lambda
module "lambda_dynamodb" {
  source = "../lambda_function"

  description   = var.dynamodb_description
  function_name = var.dynamodb_function_name
  file_name     = var.dynamodb_function_file
  zip_file_name = var.dynamodb_function_zip
  policy_name   = var.dynamodb_policy_name
  api_gateway_arn = "${module.api.execution_arn}/*/POST${module.api_resource_dynamodb.path}"
  actions       = var.dynamodb_actions

  resource = [module.dynamodb.arn]
}

module "lambda_sns" {
  source = "../lambda_function"

  description     = var.sns_description
  function_name   = var.sns_function_name
  file_name       = var.sns_function_file
  zip_file_name   = var.sns_function_zip
  policy_name     = var.sns_policy_name
  api_gateway_arn = "${module.api.execution_arn}/*/POST${module.api_resource_sns.path}"
  actions         = var.sns_actions

  resource = ["*"]
}

# Amazon Simple Storage Service (S3)
module "upload_assets" {
  source = "../aws/s3/s3_object"

  for_each     = fileset("../public/asset_files", "**")
  bucket_name  = module.static_website.s3_id
  key          = "/${each.key}"
  file_source  = "../public/asset_files/${each.value}"
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), "text/html")
  etag         = filemd5("../public/asset_files/${each.key}")
}

module "upload_html" {
  source = "../aws/s3/s3_object"

  for_each     = fileset("${var.html_path}", "**")
  bucket_name  = module.static_website.s3_id
  key          = "/${each.key}"
  file_source  = "${var.html_path}/${each.value}"
  content_type = "text/html"
  etag         = filemd5("${var.html_path}/${each.key}")
}

module "upload_pdf" {
  source = "../aws/s3/s3_object"

  for_each     = fileset("${var.pdf_path}", "**")
  bucket_name  = module.static_website.s3_id
  key          = "/${each.key}"
  file_source  = "${var.pdf_path}/${each.value}"
  content_type = "application/pdf"
  etag         = filemd5("${var.pdf_path}/${each.key}")
}

# Amazon Simple Notification Service (SNS)
module "sns" {
  source = "../aws/sns"

  name         = var.topic_name
  display_name = var.topic_display_name
  protocol     = var.topic_protocol
  endpoint     = var.topic_endpoint
}

# Amazon Route53
module "api_record" {
  source = "../aws/route53"

  zone_id       = data.aws_route53_zone.my_domain.zone_id
  name          = module.api_gateway_domain.domain_name
  alias_name    = module.api_gateway_domain.cloudfront_domain_name
  alias_zone_id = module.api_gateway_domain.cloudfront_zone_id

  depends_on = [ module.acm.validation_certificate_arn ]
}

module "blog" {
  source = "../aws/route53/CNAME"

  zone_id      = data.aws_route53_zone.my_domain.zone_id
  name         = var.blog
  type         = var.record_type
  records_list = var.record_list
}

module "cloudfront_record" {
  source = "../aws/route53"

  zone_id       = data.aws_route53_zone.my_domain.zone_id
  name          = var.my_domain
  alias_name    = module.static_website.cloudfont_domain_name
  alias_zone_id = module.static_website.cloudfont_hosted_zone_id

  depends_on = [module.acm.validation_certificate_arn ]
}

module "www_blog" {
  source = "../aws/route53/CNAME"

  zone_id      = data.aws_route53_zone.my_domain.zone_id
  name         = "www.${var.blog}"
  type         = var.record_type
  records_list = var.record_list

}