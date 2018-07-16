provider "aws" {
  region = "us-west-2"
}

resource "aws_api_gateway_rest_api" "test" {
  name = "test"
}

module "lambda" {
  source = "../.."

  file           = "main.go"
  vendor_command = "govendor sync"

  events = [
    {
      type                         = "http"
      path                         = "hello-world" // optional (default: lambda_name (/rest-api-go-main))
      method                       = ""            // optional (default: GET)
      authorization                = ""            // optional (default: NONE)
      stage                        = ""            // optional (default: prod)
      api_gateway_id               = ""            // optional (default: creates new api_gateway)
      api_gateway_root_resource_id = ""            // optional (default: creates new api_gateway)
    },
    {
      type     = "schedule"
      schedule = ""         // optional (default: rate(1 hour))
    },
  ]
}
