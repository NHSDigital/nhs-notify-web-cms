resource "aws_security_group" "rds" {
  name_prefix = "${local.csi}-rds-"
  description = "Security group for Wagtail CMS RDS PostgreSQL database"
  vpc_id      = local.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_tasks.id]
    description     = "PostgreSQL from ECS tasks"
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
      Name = "${local.csi}-rds"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
