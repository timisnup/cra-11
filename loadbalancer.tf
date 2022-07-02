#ALB 
resource "aws_lb" "application-lb" {
  name               = "assign-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.assignsg.id]
  subnets            = [aws_subnet.public-sub-1.id, aws_subnet.public-sub-2.id, aws_subnet.public-sub-3.id]

  tags = {
    Environment = "assign-alb"
  }
}

#APL target group
resource "aws_lb_target_group" "target-group" {
  health_check {
    path                = "/"
    interval            = 10
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "assign-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.cloudrock.id
}

#ALP listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}


