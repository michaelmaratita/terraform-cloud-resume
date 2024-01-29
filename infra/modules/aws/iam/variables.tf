variable "assume_role" {
  description = "Allow sts:AssumeRole"
  type = string
}

variable "policy_name" {
  description = "(Optional) The name of the role policy. If omitted, Terraform will assign a random, unique name."
  type = string
}

variable "policy" {
  description = "(Required) The inline policy document. This is a JSON formatted string. For more information about building IAM policy documents with Terraform, see the AWS IAM Policy Document Guide"
  type = string
}