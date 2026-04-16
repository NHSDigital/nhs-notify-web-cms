resource "aws_ecs_cluster" "main" {
  name = local.csi

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(
    local.default_tags,
    {
      Name = local.csi
    }
  )
}
