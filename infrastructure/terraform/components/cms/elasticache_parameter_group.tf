resource "aws_elasticache_parameter_group" "main" {
  name        = "${local.csi}-valkey"
  family      = "valkey7"
  description = "Custom parameter group for Wagtail CMS Valkey"

  # Enable Valkey slowlog
  parameter {
    name  = "slowlog-log-slower-than"
    value = "10000" # 10ms in microseconds
  }

  parameter {
    name  = "slowlog-max-len"
    value = "128"
  }

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-cache-params"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
