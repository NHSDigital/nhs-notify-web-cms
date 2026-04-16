resource "random_password" "django_secret_key" {
  length  = 50
  special = true

  # Django secret key has stricter requirements
  override_special = "!@#$%^&*()-_=+[]{}|;:,.<>?"
}

resource "aws_ssm_parameter" "django_secret_key" {
  name        = "/${var.project}/${var.environment}/${local.component}/django/secret-key"
  description = "Django secret key for Wagtail CMS"
  type        = "SecureString"
  value       = random_password.django_secret_key.result
  key_id      = module.kms.key_id

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-django-secret-key"
    }
  )

  lifecycle {
    ignore_changes = [value]
  }
}
