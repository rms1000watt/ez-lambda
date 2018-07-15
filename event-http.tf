resource "aws_api_gateway_rest_api" "0" {
  name  = "${local.api_gateway_0_name}"
  count = "${local.api_gateway_0_count}"
}

resource "aws_api_gateway_resource" "0" {
  rest_api_id = "${local.api_gateway_0_id}"
  parent_id   = "${local.api_gateway_0_id}"
  path_part   = "${local.TODODODOD}"
}

resource "aws_api_gateway_method" "0" {
  rest_api_id = "${local.api_gateway_0_id}"
  resource_id = "${aws_api_gateway_resource.0.id}"
  http_method = "${local.TODODODOD}"
}

resource "aws_api_gateway_integration" "0" {
  rest_api_id = "${local.api_gateway_0_id}"
  resource_id = "${aws_api_gateway_method.proxy.resource_id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.example.invoke_arn}"
}
