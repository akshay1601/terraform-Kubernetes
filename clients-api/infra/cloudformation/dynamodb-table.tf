resource "aws_dynamodb_table" "example" {
  name             = "${var.namespace}-clients"
  hash_key         = var.hash_key
  write_capacity = var.write
  read_capacity =  var.read

  attribute {
    name = var.attribute_name
    type = var.type
    
  }

}