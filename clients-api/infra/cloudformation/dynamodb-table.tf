resource "aws_dynamodb_table" "example" {
  name             = "example"
  hash_key         = "HASH"
  range_key      = "_id"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "HASH"
    type = "S"
  }

attribute {
    name = "_id"
    type = "S"
  }

}