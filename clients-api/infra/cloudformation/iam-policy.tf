resource "aws_iam_policy" "clients-api" {
  name = "ClientsApiPolicy"
  policy = "${file("iam-policy.json")}"
}