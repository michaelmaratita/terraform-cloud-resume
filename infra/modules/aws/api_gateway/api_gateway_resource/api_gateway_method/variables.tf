variable "api_id" {
  description = "(Required) ID of the associated REST API"
  type = string
  nullable = false
}

# aws_api_gateway_mathod.method
variable "http_method" {
  description = "(Required) HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type = string
  default = "POST"
}

variable "authorization" {
  description = "(Required) Type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
  type = string
  default = "NONE"
}

# aws_api_gateway_integration.lambda_integration
variable "type" {
  description = "(Required) Integration input's type. Valid values are HTTP (for HTTP backends), MOCK (not calling any real backend), AWS (for AWS services), AWS_PROXY (for Lambda proxy integration) and HTTP_PROXY (for HTTP proxy integration). An HTTP or HTTP_PROXY integration with a connection_type of VPC_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC."
  type = string
  default = "AWS"
}

variable "integration_http_method" {
  description = "(Optional) Integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g., Lambda function can only be invoked via POST."
  type = string
  nullable = true
  default = null
}

variable "uri" {
  description = "(Optional) Input's URI. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. For HTTP integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986 specification . For AWS integrations, the URI should be of the form arn:aws:apigateway:{region}:{subdomain.service|service}:{path|action}/{service_api}. region, subdomain and service are used to determine the right endpoint. e.g., arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:012345678901:function:my-func/invocations. For private integrations, the URI parameter is not used for routing requests to your endpoint, but is used for setting the Host header and for certificate validation."
  type = string
  nullable = true
  default = null
}

# aws_api_gateway_method_response.response_200

variable "method_response_parameters" {
  description = "(Optional) A map specifying required or optional response parameters that API Gateway can send back to the caller. A key defines a method response header name and the associated value is a boolean flag indicating whether the method response parameter is required. The method response header names must match the pattern of method.response.header.{name}, where name is a valid and unique header name."
  type = map(bool)
  default = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

variable "response_models" {
  description = "(Optional) A map specifying the model resources used for the response's content type. Response models are represented as a key/value map, with a content type as the key and a Model name as the value."
  type = map(string)
  default = {
    "application/json" = "Empty"
  }
}

# aws_api_gateway_integration_response.IntegrationResponse
variable "integration_response_parameters" {
  description = "(Optional) Map of response parameters that can be read from the backend response. For example: response_parameters = %%{ \"method.response.header.X-Some-Header\" = \"integration.response.header.X-Some-Other-Header\" }."
  type = map(string)
  default = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

variable "response_templates" {
  description = "(Optional) Map of templates used to transform the integration response body."
  type = map(string)
  default = {
    "application/json" = ""
  }
}

variable "resource_id" {
  description = "ID for API Gateway Resource"
  type = string
}

