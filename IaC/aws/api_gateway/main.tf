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

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api_gw.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_gw_stage" {
  rest_api_id   = aws_api_gateway_rest_api.api_gw.id
  deployment_id = aws_api_gateway_deployment.api_gw_deployment.id
  stage_name    = "dev"
}

resource "null_resource" "open_api" {
  triggers = {
    name     = aws_api_gateway_rest_api.api_gw.name
    api_id   = aws_api_gateway_rest_api.api_gw.id
    stage_id = aws_api_gateway_stage.api_gw_stage.id
  }

  provisioner "local-exec" {
    command = <<EOF
      aws \
      apigateway get-export \
      --parameters extensions='apigateway' \
      --rest-api-id ${self.triggers.api_id} \
      --stage-name dev \
      --accepts application/yaml \
      --export-type swagger "${self.triggers.name}-swagger.yaml"
    EOF
  }

  provisioner "local-exec" {
    when    = destroy

    command = <<EOF
      rm -f "${self.triggers.name}-swagger.yaml"
    EOF
  }
}
