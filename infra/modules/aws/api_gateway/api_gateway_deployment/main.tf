resource "aws_api_gateway_deployment" "deploy" {
  rest_api_id = var.api_id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode(
        var.redeployment
        ))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "production" {
  deployment_id = aws_api_gateway_deployment.deploy.id
  rest_api_id   = var.api_id
  stage_name    = var.stage_name
}

resource "aws_api_gateway_base_path_mapping" "api_domain_map" {
  api_id      = var.api_id
  stage_name  = aws_api_gateway_stage.production.stage_name
  domain_name = var.domain_name
}