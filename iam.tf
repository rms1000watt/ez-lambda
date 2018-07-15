resource "aws_iam_role" "lambda_go" {
  name               = "${local.lambda_go_name}"
  assume_role_policy = "${file("${path.module}/role-lambda.json")}"
  count              = "${local.lambda_go_count}"
}
