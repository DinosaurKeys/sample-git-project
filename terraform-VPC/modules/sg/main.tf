resource "aws_security_group" "my_security_group" {
  name        = "sec_group"
  description = "Allow HTTP, HTTPS, and SSH traffic"
  vpc_id      = var.my_security_group_id

  
  # This security group allows HTTP, HTTPS, and SSH traffic
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
tags = {
    Name = "sec_group"
  }

  # Ensure the security group is created in the specified VPC         
}


