variable "api_id" {
  description = "(Required) REST API identifier."
  type = string
}

variable "redeployment" {
  description = "(Optional) Map of arbitrary keys and values that, when changed, will trigger a redeployment. To force a redeployment without changing these keys/values, use the -replace option with terraform plan or terraform apply."
  type = list(string)
}

variable "stage_name" {
  description = "Optional) Name of the stage to create with this deployment. If the specified stage already exists, it will be updated to point to the new deployment. We recommend using the aws_api_gateway_stage resource instead to manage stages."
  type = string
}

variable "domain_name" {
  description = "Required) Already-registered domain name to connect the API to."
  type = string
}