locals {
  name_suffix_name = "${var.namespace != "" ? var.namespace : var.namespace }"
}

locals {
  name_suffix_account = "${var.aws-account != "" ? var.aws-account : var.aws-account}"
}

locals {
  name_suffix_region = "${var.aws-region != "" ? var.aws-region : var.aws-region}"
}

resource "aws_iam_policy" "inventory-api" {
  name = "${replace(local.name_suffix_name, "-", "")}-InventoryApiPolicy"

#policy = "${file("./clients-api/infra/cloudformation/iam-policy.json")}"
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
                "arn:aws:dynamodb:${(local.name_suffix_region)}:${replace(local.name_suffix_account, "-", "")}:table/${replace(local.name_suffix_name, "-", "")}-inventory",
                "arn:aws:dynamodb:${(local.name_suffix_region)}:${replace(local.name_suffix_account, "-", "")}:table/${replace(local.name_suffix_account, "-", "")}/index/*"
        
            ],
            "Effect": "Allow"
        }
    ]
 }

EOT
}

