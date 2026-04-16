resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${local.csi}"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = module.kms.key_arn

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-ecs-logs"
    }
  )
}

resource "aws_cloudwatch_log_subscription_filter" "ecs" {
  name            = "${local.csi}-ecs-subscription"
  log_group_name  = aws_cloudwatch_log_group.ecs.name
  filter_pattern  = ""
  destination_arn = local.log_destination_arn
  role_arn        = local.acct.log_subscription_role_arn
}
