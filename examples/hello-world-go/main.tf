provider "aws" {
  region = "us-west-2"
}

module "lambda" {
  source = "../.."

  file = "main.go"

  events = [
    {
      type           = "http"
      path           = "hello-world" // optional (default: lambda_name)
      method         = "get"         // optional (default: get)
      api_gateway_id = ""            // optional (default: creates new api_gateway)
    },
    {
      type     = "schedule"
      schedule = "rate(2 hours)" // optional (default: rate(1 hour))
    },
  ]
}
