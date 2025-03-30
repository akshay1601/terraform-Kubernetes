module "clients-api" {
    source = "./clients-api/infra/cloudformation"
   
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
