output "invoke_url" {
  description = "The API Gateway HTTP API invoke URL"
  value       = module.compute_lambda.invoke_url
}
