resource "aws_dynamodb_table" "table" {
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = var.type
  }

  ttl {
    attribute_name = var.attribute
    enabled        = var.enabled
  }

  tags = {
    Name        = "${var.name}"
    Environment = "${var.environment}"
  }

  lifecycle {
    ignore_changes = [ ttl ]
  }
}