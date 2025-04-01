resource "aws_iam_policy" "clients-api" {
  name = "ClientsApiPolicy"
  policy = file("/home/ubuntu/terraform-Kubernetes/clients-api/infra/cloudformation/iam-policy-json")
}