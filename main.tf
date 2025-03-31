module "clients-api" {
    source = "./clients-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
        stream_enabled = var.stream_enabled
    }

module "inventory-api" {
    source = "./inventory-api/infra/cloudformation"
 
    }
module "renting-api" {
    source = "./renting-api/infra/cloudformation"

    }
module "resource-api" {
    source = "./resource-api/infra/cloudformation"
 
    }
