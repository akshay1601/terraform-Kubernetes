provider "aws" {
  region = "us-east-1"
}

module "clients-api" {
    source = "./clients-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
        aws-account =  var.aws-account
        environment = var.environment

    }

module "inventory-api" {
    source = "./inventory-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
 
    }
module "renting-api" {
    source = "./renting-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type

    }
module "resource-api" {
    source = "./resource-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
 
    }

module "SSL-validation" {
    source = "./Infrastructure/cloudformation/ssl-certificate"
    domain_name = var.domain_name
    environment = var.environment
    subject_alternative_names = var.subject_alternative_names
    route-name = var.route-name
}
