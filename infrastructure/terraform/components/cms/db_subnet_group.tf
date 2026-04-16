resource "aws_db_subnet_group" "main" {
  name_prefix = "${local.csi}-"
  description = "Subnet group for Wagtail CMS RDS PostgreSQL"
  subnet_ids  = local.private_subnets

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-db-subnet-group"
    }
  )
}
