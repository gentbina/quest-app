resource "aws_lb" "app" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = aws_subnet.main[*].id
}

resource "aws_lb_target_group" "app" {
  name        = var.lb_target_group_name
  port        = var.lb_target_group_port
  protocol    = var.lb_target_group_protocol
  vpc_id      = aws_vpc.main.id
  target_type = var.lb_target_type
  health_check {
    path                = var.health_check.path
    interval            = var.health_check.interval
    timeout             = var.health_check.timeout
    healthy_threshold   = var.health_check.healthy_threshold
    unhealthy_threshold = var.health_check.unhealthy_threshold
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol

  default_action {
    type = var.lb_listener_action_type

    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.app.arn
  port              = var.lb_listener_port_https
  protocol          = var.lb_listener_protocol_https
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.app_cert.arn

  default_action {
    type             = var.lb_listener_action_type_https
    target_group_arn = aws_lb_target_group.app.arn
  }
}
