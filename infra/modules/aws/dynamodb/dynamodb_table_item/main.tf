resource "aws_dynamodb_table_item" "item" {
  table_name = var.table_name
  hash_key   = var.hash_key

  item = var.item
  
  lifecycle {
    ignore_changes = [ item ]
  }
}