variable "file" {
  description = "The Lambda function file to use"
}

variable "name" {
  description = "Vanity name for Lambda function if don't want the file to be the vanity name"
  default     = ""
}

variable "handler" {
  description = "Lambda function handler (including file name and function name)"
  default     = ""
}

variable "runtime" {
  description = "Runtime for Lambda function"
  default     = ""
}

variable "env_vars" {
  type = "map"

  default {
    TF_MODULE = "rms1000watt/tf-lambda"
  }
}

variable "timeout" {
  description = "AWS Lambda function timeout"
  default     = 5
}

variable "run_tests" {
  description = "Run tests before deploying?"
  default     = true
}

variable "events" {
  description = "List of maps of events that trigger lambda functions"

  default = [{
    type           = ""
    authorization  = ""
    api_gateway_id = ""
    method         = ""
    path           = ""
    stage          = ""
  }]
}
