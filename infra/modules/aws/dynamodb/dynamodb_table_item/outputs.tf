output "hash_key" {
  description = "Hash key to use for lookups and identification of the item"
  value = aws_dynamodb_table_item.item.hash_key
}

output "item" {
  description = "JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item."
  value = aws_dynamodb_table_item.item.item
}

output "table_name" {
  description = "Name of the table to contain the item"
  value = aws_dynamodb_table_item.item.table_name
}