variable "function_name" {
  type        = string
  description = "lambda function name"
  default     = "lambda_iac_demo"
}

variable "handler" {
  type        = string
  description = "lambda entry point"
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip" {
  type        = string
  description = "lambda .zip file in local storage"
  default     = "lambda.zip"
}

variable "runtime" {
  type        = string
  description = "lambda runtime environment"
  default     = "python3.8"
}

# vim: set tabstop=2 sw=2 expandtab:
# vim: set ft=terraform:
