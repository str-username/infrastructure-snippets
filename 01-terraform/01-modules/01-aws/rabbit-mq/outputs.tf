output "arn" {
  description = "Broker arn"
  value = aws_mq_broker.main.arn
}

output "id" {
  description = "Broker id"
  value = aws_mq_broker.main.id
}

output "console_url" {
  description = "Broker console access url"
  value = aws_mq_broker.main.instances.0.console_url
}

output "ip_address" {
  description = "Broker ip address"
  value = aws_mq_broker.main.instances.0.ip_address
}

output "endpoints" {
  description = "Broker connection endpoint with specific protocol"
  value = aws_mq_broker.main.instances.0.endpoints
}