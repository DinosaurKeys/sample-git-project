
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}


output "subnet_ids" {
  description = "The IDs of the subnets"
  # This output returns a list of subnet IDs created in the VPC "[*] "
  value       = aws_subnet.my_subnets[*].id
  
}

