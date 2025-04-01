locals {
  name_suffix = "${var.namespace != "" ? var.namespace : var.environment}"
}

resource "aws_iam_policy" "clients-api" {
  name = "${replace(local.name_suffix, "-", "")}-ClientsApiPolicy"

#   policy = "${file("./clients-api/infra/cloudformation/iam-policy.json")}"
policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "dynamodb:BatchGetItem",
                "dynamodb:PutItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:Scan",
                "dynamodb:Query",
                "dynamodb:UpdateItem"
            ],
            "Resource": [
                "arn:aws:dynamodb:us-east-1:${aws-account}:table/${replace(local.name_suffix, "-", "")}-clients",
                "arn:aws:dynamodb:us-east-1:${aws-account}:table/${aws-account}/index/*"
        
            ],
            "Effect": "Allow"
        }
    ]
 }
EOT
}

