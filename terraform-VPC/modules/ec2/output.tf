output "instance_ids" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.joey_instance.*.id
}