### GET doesnt actually work... attempted GET using the recommendation below, but no luck
### Using POST as workaround to retrieve counter
# https://github.com/hashicorp/terraform/issues/9271

### API Configuration ###
resource "aws_api_gateway_resource" "api_resource" {
  rest_api_id = var.rest_api
  parent_id   = var.rest_api_parent
  path_part   = var.api_path_part
}

resource "aws_api_gateway_method" "method" {
  rest_api_id    = var.rest_api
  resource_id    = aws_api_gateway_resource.api_resource.id
  http_method    = "POST"
  authorization  = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = var.rest_api
  resource_id             = aws_api_gateway_resource.api_resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.method.http_method
  status_code = 200
  
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  response_templates = {
    "application/json" = ""
  }

  depends_on = [ 
    aws_lambda_function.lambda,
    aws_api_gateway_integration.lambda_integration,
    aws_api_gateway_method.method
  ]
  
}

####### Enabling CORS ########

resource "aws_api_gateway_method" "cors" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "cors" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.cors.http_method
  type = "MOCK"

  request_templates = {
    "application/json" = "{\"statusCode\" : 200}"
  }
}

resource "aws_api_gateway_method_response" "cors" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.cors.http_method
  status_code = 200
  
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }
  
  response_models = {
    "application/json" = "Empty"
  }

  depends_on = [
    aws_api_gateway_method.cors
  ]
}

resource "aws_api_gateway_integration_response" "cors" {
  rest_api_id = var.rest_api
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.cors.http_method
  status_code = 200
  
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'", 
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'" # remove or add HTTP methods as needed
  }
  
  depends_on = [
    aws_api_gateway_integration.cors, 
    aws_api_gateway_method_response.cors
  ]
}