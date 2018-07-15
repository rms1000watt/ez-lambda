output "lambda_name" {
  value = "${local.lambda_name}"
}

output "rest_api_0_url" {
  value = "${aws_api_gateway_deployment.0.*.invoke_url}"
}
