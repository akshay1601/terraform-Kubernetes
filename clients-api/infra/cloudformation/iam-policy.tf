resource "aws_iam_policy" "clients" {     
    name = "${namespace}-ClientsApiPolicy"                                                                                                  
    policy = file("/clients-api/infra/cloudformation/iam-policy-json")         
} 