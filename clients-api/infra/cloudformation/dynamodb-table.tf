resource "aws_dynamodb_table" "clients" {
  name             = "${var.namespace}-clients"
  hash_key         = var.hash_key
  write_capacity   = var.write
  read_capacity    = var.read 
  

attribute {
    name = var.hash_key
    type = var.type
    
  }

}

