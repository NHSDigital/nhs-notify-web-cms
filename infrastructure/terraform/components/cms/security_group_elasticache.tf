resource "aws_security_group" "elasticache" {
  name_prefix = "${local.csi}-elasticache-"
  description = "Security group for Wagtail CMS ElastiCache Redis"
  vpc_id      = local.vpc_id

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_tasks.id]
    description     = "Redis from ECS tasks"
  }

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
      Name = "${local.csi}-elasticache"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
