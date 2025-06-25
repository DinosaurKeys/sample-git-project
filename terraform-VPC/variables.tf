variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "my_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  }