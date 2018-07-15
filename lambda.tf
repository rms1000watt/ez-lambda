resource "aws_lambda_function" "lambda_go" {
  filename         = "${local.lambda_go_zip}"
  function_name    = "${local.lambda_go_name}"
  handler          = "${local.lambda_go_handler}"
  role             = "${aws_iam_role.lambda_go.arn}"
  source_code_hash = "${data.archive_file.lambda_go.output_base64sha256}"
  runtime          = "${local.lambda_go_runtime}"
  timeout          = "${var.timeout}"

  environment {
    variables = "${var.env_vars}"
  }

  count = "${local.lambda_go_count}"
}
