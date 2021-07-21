provider "aws" {
  region = "us-west-2"
} 

resource "aws_api_gateway_rest_api" "api_gw" {
  name = var.name
  body = templatefile("example.yaml", {})

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "api_gw_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gw.id
  stage_name  = var.stage
}

output "api_gw_url" {
  value = aws_api_gateway_deployment.api_gw_deployment.invoke_url
}
