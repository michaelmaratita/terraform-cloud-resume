module "dynamodb" {
  source = "../aws/dynamodb"

  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  type           = var.type
  attribute      = var.attribute
  environment    = var.environment
}

module "dynamodb_item" {
  source = "../aws/dynamodb/dynamodb_table_item"

  table_name = module.dynamodb.name
  hash_key   = module.dynamodb.hash_key
  item       = var.table_item
}