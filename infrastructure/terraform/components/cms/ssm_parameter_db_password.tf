resource "random_password" "db_password" {
  length  = 32
  special = true
  # Exclude characters that might cause issues in connection strings
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "db_password" {
  name        = "/${var.project}/${var.environment}/${local.component}/db/password"
  description = "RDS PostgreSQL password for Wagtail CMS"
  type        = "SecureString"
  value       = random_password.db_password.result
  key_id      = module.kms.key_id

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-db-password"
    }
  )

  lifecycle {
    ignore_changes = [value]
  }
}
