output "arn" {
  description = "ARN for DynamoDB table"
  value = module.dynamodb.arn
}

output "id" {
  description = "ID for DynamoDB table"
  value = module.dynamodb.id
}

output "table_name" {
  description = "Name of the table to contain the item"
  value = module.dynamodb.name
}

output "hash_key" {
  description = "Hash key to use for lookups and identification of the item"
  value = module.dynamodb.hash_key
}

output "tags_all" {
  description = "Tags associated with DynamoDB table"
  value = module.dynamodb.tags_all
}

output "item" {
  description = "JSON representation of a map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item."
  value = module.dynamodb_item.item
}

