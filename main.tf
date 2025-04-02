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
        aws-region = var.aws-region

    }

module "inventory-api" {
    source = "./inventory-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
        aws-region = var.aws-region
        aws-account =  var.aws-account
 
    }
module "renting-api" {
    source = "./renting-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
        aws-region = var.aws-region
        aws-account =  var.aws-account

    }
module "resource-api" {
    source = "./resource-api/infra/cloudformation"
        namespace = var.namespace
        hash_key = var.hash_key
        write = var.write
        read = var.read
        type = var.type
        aws-region = var.aws-region
        aws-account =  var.aws-account
 
    }

module "SSL-validation" {
    source = "./Infrastructure/cloudformation/ssl-certificate"
    domain_name = var.domain_name
    environment = var.environment
    subject_alternative_names = var.subject_alternative_names
    route-name = var.route-name
}

module "loadbalancer-controller" {
    source = "./Infrastructure/k8s-tooling/load-balancer-controller"
    lb-iam-name = var.lb-iam-name
}
