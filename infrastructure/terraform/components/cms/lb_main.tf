resource "aws_lb" "main" {
  name_prefix        = "cms-"
  internal           = true
  load_balancer_type = "application"

  subnets         = local.private_subnets
  security_groups = [aws_security_group.alb.id]

  drop_invalid_header_fields = true

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-alb"
    }
  )
}
