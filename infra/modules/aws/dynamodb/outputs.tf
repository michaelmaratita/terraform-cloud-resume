output "arn" {
  description = "ARN of the table"
  value = aws_dynamodb_table.table.arn
}

output "id" {
  description = "Name of the table"
  value = aws_dynamodb_table.table.id
}

output "hash_key" {
  description = "Hash key to use for lookups and identification of the item"
  value = aws_dynamodb_table.table.hash_key
}

output "name" {
  description = "Name of the table"
  value = aws_dynamodb_table.table.name
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_dynamodb_table.table.tags_all
}