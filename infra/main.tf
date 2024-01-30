module "resume_site" {
  source = "./modules/my_portfolio"

  # AWS Certificate Manager (ACM)
  my_domain                 = var.my_domain
  subject_alternative_names = "*.${var.my_domain}"

  # API Gateway
  api_name = var.api_name
  api_description = var.api_description
  api_types = ["REGIONAL"]
  api_domain_name = var.api_domain
  dynamodb_path_part = var.api_db
  sns_path_part = var.api_sns
  http_method = "POST"

  # CloudFront 
  origin_access_name = "OAC ${var.bucket_name}"
  origin_access_description = "Original Access Controls for Static Website Hosting: ${var.bucket_name}"
  cloudfront_comment = "Static website hosting for ${var.bucket_name}"
  origin_id = var.origin_id

  # DynamoDB
  table_name = var.table_name
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = var.hash_key
  type = "N"
  attribute = "TimeToExist"
  environment = "Production"
  table_item = var.table_item

  # IAM 
  dynamodb_policy_name = var.iam_dynamodb_policy
  sns_policy_name = var.iam_sns_policy

  # Lambda
  dynamodb_description = var.lambda_db_desc
  dynamodb_function_name = var.lambda_db
  dynamodb_function_file = var.db_py
  dynamodb_function_zip = var.db_zip
  
  sns_description = var.lambda_sns_desc
  sns_function_name = var.lambda_sns
  sns_function_file = var.sns_py
  sns_function_zip = var.sns_zip
  
  dynamodb_actions = [
    "dynamodb:GetItem",
    "dynamodb:UpdateItem"
  ]

  sns_actions = [
    "sns:Publish",
    "sns:ListTopics"
  ]

  # S3
  bucket_name = var.bucket_name
  bucket_policy_sid = "AllowCloudFrontServicePrincipalReadOnly"
  assets_path = var.assets_path
  html_path = var.html_path
  pdf_path = var.pdf_path
  
  # SNS
  topic_name = "${var.api_sns}me"
  topic_display_name = var.topic_display
  topic_endpoint = var.my_email

  # Route53
  blog = var.blog
  record_type = "CNAME"
  record_list = var.record_list
  }