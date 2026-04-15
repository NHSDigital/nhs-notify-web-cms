resource "aws_security_group" "ecs_tasks" {
  name_prefix = "${local.csi}-ecs-tasks-"
  description = "Security group for Wagtail CMS ECS tasks"
  vpc_id      = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

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
