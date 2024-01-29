# AWS IAM Role
module "iam_role_lambda" {
  source = "../aws/iam"

  assume_role = module.lambda_function.assume_role
  policy_name = var.policy_name
  policy = module.lambda_function.policy
}

module "lambda_function" {
  source = "../aws/lambda"

  description   = var.description
  function_name = var.function_name
  file_name     = var.file_name
  zip_file_name = var.zip_file_name
  role          = module.iam_role_lambda.arn

  actions = var.actions
  resource = var.resource
}