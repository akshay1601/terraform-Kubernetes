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
                "arn:aws:dynamodb:us-east-1:${aws-account}:table/${namespace}-clients",
                "arn:aws:dynamodb:us-east-1:${aws-account}:table/${aws-account}/index/*"
        
            ],
            "Effect": "Allow"
        }
    ]
 }
EOT
}

