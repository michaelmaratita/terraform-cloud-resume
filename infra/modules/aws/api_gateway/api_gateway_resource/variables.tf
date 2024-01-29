# ALL
variable "api_id" {
  description = "(Required) ID of the associated REST API"
  type = string
  nullable = false
}

# aws_api_gateway_resource.resource
variable "parent_id" {
  description = "(Required) ID of the parent API resource"
  type = string
  nullable = false
}

variable "path_part" {
  description = "(Required) Last path segment of this API resource."
  type = string
  nullable = false
}
