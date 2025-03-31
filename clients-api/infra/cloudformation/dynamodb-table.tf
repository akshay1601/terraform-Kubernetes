resource "aws_dynamodb_table" "example" {
  name             = "${var.namespace}-clients"
  hash_key         = var.hash_key
  

attribute {
    name = var.hash_key
    type = var.type
    
  }

}
