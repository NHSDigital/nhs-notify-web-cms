resource "aws_db_parameter_group" "main" {
  name_prefix = "${local.csi}-"
  family      = "postgres16"
  description = "Custom parameter group for Wagtail CMS PostgreSQL"

  # Wagtail/Django optimisations from https://docs.djangoproject.com/en/4.2/ref/databases/#postgresql-notes
  parameter {
    name         = "shared_preload_libraries"
    value        = "pg_stat_statements"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "1000" # Log queries slower than 1 second
  }

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-db-params"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
