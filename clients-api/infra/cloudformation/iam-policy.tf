resource "aws_iam_policy" "clients" {     
    name = "${Namespace}-ClientsApiPolicy"                                                                                                  
    policy = file("/clients-api/infra/cloudformation/iam-policy-json")         
} 