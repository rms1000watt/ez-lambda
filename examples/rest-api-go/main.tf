provider "aws" {
  region = "us-west-2"
}

module "lambda" {
  source = "../.."

  file = "main.go"

  events = [
    {
      type           = "http"
      path           = ""     // optional (default: lambda_name)
      method         = ""     // optional (default: get)
      api_gateway_id = ""     // optional (default: creates new api_gateway)
      authorization  = ""     // optional (default: NONE)
      stage          = ""     // optional (default: prod)
    },
    {
      type     = "schedule"
      schedule = ""         // optional (default: rate(1 hour))
    },
  ]
}
