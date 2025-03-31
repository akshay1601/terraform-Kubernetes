resource "aws_dynamodb_table" "example" {
  name             = "${var.namespace}-clients"
  hash_key         = var.hash_key
  stream_enabled   = true
  stream_view_type = var.stream_enabled
  

attribute {
    name = var.hash_key
    type = var.type
    
  }

}
