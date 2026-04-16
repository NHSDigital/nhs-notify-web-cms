resource "aws_lb_target_group" "main" {
  name        = local.csi
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = local.vpc_id

  health_check {
    path                = "/health/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 86400  # 24 hours
    enabled         = true
  }

  deregistration_delay = 30

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-tg"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
