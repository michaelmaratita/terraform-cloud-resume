resource "aws_api_gateway_rest_api" "api" {
  name        = "API"
  description = "This is my API for my Cloud Resume Project"

   endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "deploy" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      var.sns_api_resource,
      var.sns_method, 
      var.sns_lambda_integration,
      var.sns_integration_response,
      var.db_api_resource,
      var.db_method, 
      var.db_lambda_integration,
      var.db_integration_response
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "production" {
  deployment_id = aws_api_gateway_deployment.deploy.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "Production"
}

resource "aws_api_gateway_base_path_mapping" "api_domain_map" {
  api_id      = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.production.stage_name
  domain_name = aws_api_gateway_domain_name.api.domain_name
}