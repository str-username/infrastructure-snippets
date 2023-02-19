output "security_group_ids" {
  value = { for group in aws_security_group.main : group.name => group }
}