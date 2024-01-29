resource "aws_api_gateway_rest_api" "api" {
  name        = var.name
  description = var.description

   endpoint_configuration {
    types = var.types
  }
}