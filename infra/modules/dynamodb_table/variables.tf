variable "table_name" {
  description = "Name for DynamoDB table"
  type = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB table"
  type = string
}

variable "read_capacity" {
  description = "Numerical value for read capacity"
  type = number
}

variable "write_capacity" {
  description = "Numerical value for read capacity"
  type = number
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type = string
}

variable "type" {
  description = "Type value for hash key"
  type = string
}

variable "attribute" {
  description = "TTL attribute for DynamoDB table"
  type = string
}

variable "environment" {
  description = "Environment value for DynamoDB table"
  type = string
}

variable "table_item" {
  description = "Item values for DynamoDB table"
  type = string
}