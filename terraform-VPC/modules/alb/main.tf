#ALB module for AWS

resource "aws_lb" "my_application_load_balancer" {
  name               = "my-application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.var_security_group_id]
  subnets            = var.var_alb_subnet_ids
  
    tags = {
      Name = "my_application_load_balancer_name"
    }
}  


#Listener for the ALB

resource "aws_lb_listener" "my_application_load_balancer" {
  load_balancer_arn = aws_lb.my_application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_alb_target_group.arn
  }
}

#Target group for the ALB
resource "aws_lb_target_group" "my_alb_target_group" {
  name        = "my-app-alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.var_my_alb_target_group_vpc_id
}


#Target group attached to the ALB
resource "aws_lb_target_group_attachment" "my_alb_target_group_attachment" {
  count            = length(var.var_target_id_instance)
  target_group_arn = aws_lb_target_group.my_alb_target_group.arn
  target_id       = var.var_target_id_instance[count.index]
  port             = 80
}

 