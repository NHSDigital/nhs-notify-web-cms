resource "aws_security_group" "ecs_tasks" {
  name_prefix = "${local.csi}-ecs-tasks-"
  description = "Security group for Wagtail CMS ECS tasks"
  vpc_id      = local.vpc_id

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-ecs-tasks"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ecs_tasks_ingress_alb" {
  security_group_id        = aws_security_group.ecs_tasks.id
  type                     = "ingress"
  description              = "Allow inbound traffic from ALB on container port"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "ecs_tasks_egress_all" {
  security_group_id = aws_security_group.ecs_tasks.id
  type              = "egress"
  description       = "Allow all outbound traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
