resource "aws_dynamodb_table" "views-dynamodb-table" {
  name           = "viewer_count"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "viewer_count"
    Environment = "production"
  }

  lifecycle {
    ignore_changes = [ ttl ]
  }
}

resource "aws_dynamodb_table_item" "item" {
  table_name = aws_dynamodb_table.views-dynamodb-table.name
  hash_key   = aws_dynamodb_table.views-dynamodb-table.hash_key

  item = <<ITEM
{
  "Id": {"N": "0"},
  "value": {"N": "0"}
}
ITEM
  
  lifecycle {
    ignore_changes = [ item ]
  }
}