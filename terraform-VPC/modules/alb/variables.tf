variable "var_security_group_id" {
  description = "The ID of the security group to be used by the ALB"
  type        = string
  
}

variable "var_alb_subnet_ids" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
  
}

variable "var_my_alb_target_group_vpc_id" {
  description = "The VPC ID of the target group for the ALB"
  type        = string
}

variable "var_target_id_instance" {
  description = "The target ID of the instance to be attached to the ALB target group"
  type        = list(string)
  
}