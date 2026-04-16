resource "aws_cloudwatch_log_group" "rds" {
  name              = "/aws/rds/${local.csi}/postgresql"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = module.kms.key_arn

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-rds-logs"
    }
  )
}
