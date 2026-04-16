resource "aws_cloudwatch_log_group" "elasticache_slow" {
  name              = "/aws/elasticache/${local.csi}/slow-log"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = module.kms.key_arn

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-elasticache-slow-logs"
    }
  )
}

resource "aws_cloudwatch_log_group" "elasticache_engine" {
  name              = "/aws/elasticache/${local.csi}/engine-log"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = module.kms.key_arn

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-elasticache-engine-logs"
    }
  )
}
