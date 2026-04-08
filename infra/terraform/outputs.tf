output "instance_public_ip" {
  description = "Public IP of the API instance"
  value       = aws_instance.api.public_ip
}

output "api_url" {
  description = "Base URL of the deployed API"
  value       = "http://${aws_instance.api.public_ip}:${var.app_port}"
}

output "health_url" {
  description = "Health endpoint URL"
  value       = "http://${aws_instance.api.public_ip}:${var.app_port}/health"
}