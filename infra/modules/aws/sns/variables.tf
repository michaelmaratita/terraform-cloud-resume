# SNS Topic
variable "name" {
  description = "(Optional) The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type = string
}

variable "display_name" {
  description = "(Optional) The display name for the topic"
  type = string
}

# SNS Subscription
variable "protocol" {
  description = "(Required) Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported."
  type = string
}

variable "endpoint" {
  description = "(Required) Endpoint to send data to. The contents vary with the protocol."
  type = string
}