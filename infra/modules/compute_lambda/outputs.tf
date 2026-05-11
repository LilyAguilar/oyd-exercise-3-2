output "invoke_url" {
  description = "The APIGW stage invoke URL"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
