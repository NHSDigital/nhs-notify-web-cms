resource "aws_elasticache_subnet_group" "main" {
  name        = "${local.csi}-cache-subnet-group"
  description = "Subnet group for Wagtail CMS ElastiCache Redis"
  subnet_ids  = local.private_subnets

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-cache-subnet-group"
    }
  )
}
