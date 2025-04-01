resource "aws_iam_policy" "clients-api" {
  name = "ClientsApiPolicy"
  policy = "${file("./clients-api/infra/cloudformation/iam-policy.json")}"
}