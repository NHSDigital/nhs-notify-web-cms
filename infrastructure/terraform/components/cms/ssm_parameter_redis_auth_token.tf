resource "random_password" "redis_auth_token" {
  length  = 32
  special = true

  # Redis auth token has stricter requirements
  override_special = "!&#$^<>-"
}

resource "aws_ssm_parameter" "redis_auth_token" {
  name        = "/${var.project}/${var.environment}/${local.component}/redis/auth-token"
  description = "Valkey auth token for Wagtail CMS cache (Redis-compatible)"
  type        = "SecureString"
  value       = random_password.redis_auth_token.result
  key_id      = module.kms.key_id

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-redis-token"
    }
  )

  lifecycle {
    ignore_changes = [value]
  }
}
