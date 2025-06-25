variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "my_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  }

variable "my_subnet_name" {
  description = "Name for the public subnet"
  type        = list(string)
  default     = ["my_subnet_1", "my_subnet_2"]
  
}

