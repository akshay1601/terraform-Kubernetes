resource "aws_iam_policy" "clients-api" {
  name = "ClientsApiPolicy"
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
                "arn:aws:dynamodb:us-east-1:654654152817:table/development-clients",
                "arn:aws:dynamodb:us-east-1:654654152817:table/654654152817/index/*"
            ],
            "Effect": "Allow"
        }
    ]
 }
EOT
}

