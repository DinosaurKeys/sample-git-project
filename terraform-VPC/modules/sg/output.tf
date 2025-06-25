output "my_security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.my_security_group.id
}       