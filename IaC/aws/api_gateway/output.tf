output "invoke_url" {
  description = "API Gateway Stage Invoke URL"
  value       = "curl ${aws_api_gateway_stage.api_gw_stage.invoke_url}"
}
