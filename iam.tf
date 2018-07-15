resource "aws_iam_role" "lambda_go" {
  name               = "${local.lambda_go_name}"
  assume_role_policy = "${file("${path.module}/role-lambda.json")}"
  count              = "${local.lambda_go_count}"
}

resource "aws_iam_role" "lambda_py" {
  name               = "${local.lambda_py_name}"
  assume_role_policy = "${file("${path.module}/role-lambda.json")}"
  count              = "${local.lambda_py_count}"
}

resource "aws_iam_role" "lambda_js" {
  name               = "${local.lambda_js_name}"
  assume_role_policy = "${file("${path.module}/role-lambda.json")}"
  count              = "${local.lambda_js_count}"
}
