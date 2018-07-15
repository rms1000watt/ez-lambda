locals {
  // Variable setup
  path_root_list = "${split("/", path.root)}"
  path_root_len  = "${length(local.path_root_list)}"
  parent_dir     = "${element(local.path_root_list, local.path_root_len - 1)}"

  // Lambda for Golang
  lambda_go         = "${contains(split(".", var.file), "go")}"
  lambda_go_count   = "${local.lambda_go ? 1 : 0}"
  lambda_go_runtime = "${local.lambda_go && var.runtime != "" ? var.runtime : "go1.x" }"
  lambda_go_name    = "${local.lambda_go && var.name    != "" ? var.name    : "${local.parent_dir}-${replace(var.file, ".go", "")}" }" //"
  lambda_go_handler = "${local.lambda_go && var.handler != "" ? var.handler : local.lambda_go_name}"
  lambda_go_bin     = "${path.root}/bin/${local.lambda_go_name}"
  lambda_go_zip     = "${local.lambda_go ? "${path.root}/.terraform/archive_files/${local.lambda_go_name}-lambda.zip" : ""}"           //"

  // Lambda for Python
  lambda_py      = "${contains(split(".", var.file), "py")}"
  lambda_py_name = "${local.lambda_py && var.name != "" ? var.name : "${local.parent_dir}-${replace(var.file, ".py", "")}" }" //"

  // Lambda for JS
  lambda_js      = "${contains(split(".", var.file), "js")}"
  lambda_js_name = "${local.lambda_js && var.name != "" ? var.name : "${local.parent_dir}-${replace(var.file, ".js", "")}" }" //"

  // Lambda Generic
  lambda_name = "${var.name != "" ? var.name : (local.lambda_go ? local.lambda_go_name : (local.lambda_py ? local.lambda_py_name : (local.lambda_js ? local.lambda_js_name : "${local.parent_dir}-ez-lambda" ))) }" //"
}

// Event 0
locals {
  event_0      = "${element(var.events, 0)}"
  event_0_type = "${local.event_0.type}"

  // API Gateway
  api_gateway_0       = "${local.event_0_type == "http"}"
  api_gateway_0_count = "${local.api_gateway_0 ? 1 : 0}"
  api_gateway_0_name  = "${local.lambda_name}-api-gateway-0"
  api_gateway_0_new   = "${local.event_0.api_gateway_id == ""}"
  api_gateway_0_id    = "${local.api_gateway_0_new ? aws_api_gateway_rest_api.0.id : "TODO fetch from events list" }"
}
