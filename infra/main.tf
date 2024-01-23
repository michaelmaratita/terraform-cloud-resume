module "cloud_resume" {
  source = "./modules/"

  #  S3
  bucket_name         = var.bucket_name
  public_path         = var.public_path

  # CloudFront
  cdn_alias = var.cdn_alias

  #SNS
  my_email = var.my_email

  # API Gateway
  db_api_resource          = module.apigateway-lambda["dynamodb"].api_resource
  db_method                = module.apigateway-lambda["dynamodb"].method
  db_lambda_integration    = module.apigateway-lambda["dynamodb"].lambda_integration
  db_integration_response  = module.apigateway-lambda["dynamodb"].integration_response
  sns_api_resource         = module.apigateway-lambda["sns"].api_resource
  sns_method               = module.apigateway-lambda["sns"].method
  sns_lambda_integration   = module.apigateway-lambda["sns"].lambda_integration
  sns_integration_response = module.apigateway-lambda["sns"].integration_response
  caller_identity          = data.aws_caller_identity.current.account_id
}

module "apigateway-lambda" {
  source = "./modules/apigateway-method_lambda/"
  
  rest_api            = module.cloud_resume.rest_api
  rest_api_parent     = module.cloud_resume.rest_api_parent
  api_domain_name     = module.cloud_resume.api_domain_name
  
  for_each            = var.api_lambda
  api_path_part       = each.value.api_path_part 
  function_name       = each.value.function_name
  lambda_description  = each.value.lambda_description
  lambda_folder       = each.value.lambda_folder
  lambda_resource     = each.value.lambda_resource
  policy_name         = each.value.policy_name
  policy_actions      = each.value.policy_actions
  caller_identity          = data.aws_caller_identity.current.account_id
}