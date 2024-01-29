variable "attribute" {
  description = "(Required) Set of nested attribute definitions. Only required for hash_key and range_key attributes."
  type = string
}

variable "enabled" {
  description = "(Required) Whether TTL is enabled."
  type = bool
  default = false
}

variable "environment" {
  description = "Tag value for what environment this applies to."
  type = string
}

variable "hash_key" {
  description = "(Required, Forces new resource) Attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type = string
}

variable "name" {
  description = "(Required) Unique within a region name of the table."
  type = string
}

variable "billing_mode" {
  description = "(Optional) Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
  type = string
}

variable "read_capacity" {
  description = "(Optional) Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  type = number
}

variable "type" {
  description = "(Required) Attribute type. Valid values are S (string), N (number), B (binary)."
  type = string
}

variable "write_capacity" {
  description = "(Optional) Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  type = number
}