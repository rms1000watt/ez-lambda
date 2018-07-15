locals {
  // Variable setup
  path_root_list = "${split("/", path.root)}"
  path_root_len  = "${length(local.path_root_list)}"
  parent_dir     = "${element(local.path_root_list, local.path_root_len - 1)}"

  // Lambda for Golang
  lambda_go         = "${contains(split(".", var.file), "go")}"
  lambda_go_count   = "${local.lambda_go ? 1 : 0}"
  lambda_go_name    = "${local.lambda_go && var.name    != "" ? var.name    : "${local.parent_dir}-${replace(var.file, ".go", "")}" }" //"
  lambda_go_runtime = "${local.lambda_go && var.runtime != "" ? var.runtime : "go1.x" }"
  lambda_go_handler = "${local.lambda_go && var.handler != "" ? var.handler : local.lambda_go_name}"
  lambda_go_bin     = "${path.root}/bin/${local.lambda_go_name}"
  lambda_go_zip     = "${local.lambda_go ? "${path.root}/.terraform/archive_files/${local.lambda_go_name}-lambda.zip" : ""}"           //"

  // Lambda for Python
  lambda_py             = "${contains(split(".", var.file), "py")}"
  lambda_py_count       = "${local.lambda_py ? 1 : 0}"
  lambda_py_name        = "${local.lambda_py && var.name != "" ? var.name : "${local.parent_dir}-${replace(var.file, ".py", "")}" }" //"
  lambda_py_runtime     = "${local.lambda_py && var.runtime != "" ? var.runtime : "python3.6" }"
  lambda_py_handler     = "${local.lambda_py && var.handler != "" ? var.handler : "${local.lambda_py_name}.handler" }"               //"
  lambda_py_source_file = "${local.lambda_py ? var.file : ""}"
  lambda_py_zip         = "${local.lambda_py ? "${path.root}/.terraform/archive_files/${local.lambda_py_name}-lambda.zip" : ""}"     //"

  // Lambda for JS
  lambda_js             = "${contains(split(".", var.file), "js")}"
  lambda_js_count       = "${local.lambda_js ? 1 : 0}"
  lambda_js_name        = "${local.lambda_js && var.name != "" ? var.name : "${local.parent_dir}-${replace(var.file, ".js", "")}" }" //"
  lambda_js_runtime     = "${local.lambda_js && var.runtime != "" ? var.runtime : "nodejs8.10" }"
  lambda_js_handler     = "${local.lambda_js && var.handler != "" ? var.handler : "${local.lambda_js_name}.handler" }"               //"
  lambda_js_source_file = "${local.lambda_js ? var.file : ""}"
  lambda_js_zip         = "${local.lambda_js ? "${path.root}/.terraform/archive_files/${local.lambda_js_name}-lambda.zip" : ""}"     //"

  // Lambda Generic
  lambda_name = "${var.name != "" ? var.name : (local.lambda_go ? local.lambda_go_name : (local.lambda_py ? local.lambda_py_name : (local.lambda_js ? local.lambda_js_name : "${local.parent_dir}-ez-lambda" ))) }" //"
}

// Event 0
locals {
  event_0      = "${var.events[0]}"
  event_0_type = "${local.event_0["type"]}"

  // API Gateway
  api_gateway_0               = "${lower(local.event_0_type) == "http"}"
  api_gateway_0_count         = "${local.api_gateway_0 ? 1 : 0}"
  api_gateway_0_name          = "${local.lambda_name}-api-gateway-0"
  api_gateway_0_new           = "${local.api_gateway_0 && local.event_0["api_gateway_id"] == ""}"
  api_gateway_0_path          = "${local.event_0["path"] != ""   ? local.event_0["path"]          : local.lambda_name }"
  api_gateway_0_method        = "${local.event_0["method"] != "" ? upper(local.event_0["method"]) : "GET" }"
  api_gateway_0_stage         = "${local.event_0["stage"] != ""  ? local.event_0["stage"]         : "prod" }"
  api_gateway_0_authorization = "${local.event_0["authorization"] != "" || lower(local.event_0["authorization"]) != "none" ? local.event_0["authorization"] : "NONE" }"
}
