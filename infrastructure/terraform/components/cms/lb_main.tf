resource "aws_lb" "main" {
  name               = local.csi
  internal           = false
  load_balancer_type = "application"

  subnets         = local.public_subnets
  security_groups = [aws_security_group.alb.id]

  drop_invalid_header_fields = true

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-alb"
    }
  )
}
