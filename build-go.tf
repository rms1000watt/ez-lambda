resource "null_resource" "go_build" {
  provisioner "local-exec" {
    command = "${var.run_tests ? "go test ./... && " : ""}GOOS=linux go build -o ${local.lambda_go_bin}"
  }

  triggers {
    b64sha            = "${base64sha256(file(var.file))}"
    lambda_go_runtime = "${local.lambda_go_runtime}"
    lambda_go_name    = "${local.lambda_go_name}"
    lambda_go_handler = "${local.lambda_go_handler}"
    lambda_go_bin     = "${local.lambda_go_bin}"
    lambda_go_zip     = "${local.lambda_go_zip}"
  }

  count = "${local.lambda_go_count}"
}

data "archive_file" "lambda_go" {
  type        = "zip"
  source_file = "${local.lambda_go_bin}"
  output_path = "${local.lambda_go_zip}"

  depends_on = ["null_resource.go_build"]
  count      = "${local.lambda_go_count}"
}
