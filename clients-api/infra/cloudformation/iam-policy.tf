resource "aws_iam_policy" "clients" {     
    name = "${var.namespace}-clients"                                                                                                  
    policy = file("iam-policy.json")         
} 