resource "aws_dynamodb_table" "clients" {
  name             = "${namespace}-ClientsApiPolicy"
  hash_key         = var.hash_key
  write_capacity   = var.write
  read_capacity    = var.read 
  

attribute {
    name = var.hash_key
    type = var.type
    
  }

}

