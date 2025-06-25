variable "my_sec_group_id" {
  description = "Security group for the EC2 instance"
  type        = string
 }

 variable "my_subnets" {
   description = "value of the subnets of my EC2 instance"
   type        = list(string)
 }

 variable "ec2_instance_name" {
   description = "Name of the EC2 instance"
   type        = list(string)
   default     = ["joey_instance_1", "joey_instance_2"]
 }