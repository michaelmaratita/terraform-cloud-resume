variable "table_name" {
  description = "(Required) Name of the table to contain the item"
  type = string
}

variable "hash_key" {
  description = "(Required) Hash key to use for lookups and identification of the item"
  type = string
}

variable "item" {
  description = "(Required) JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item."
  type = string
}