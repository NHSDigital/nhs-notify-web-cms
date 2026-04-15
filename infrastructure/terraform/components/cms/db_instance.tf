resource "aws_db_instance" "main" {
  identifier        = "${local.csi}-db"
  engine            = "postgres"
  engine_version    = "16.6"
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type      = "gp3"
  storage_encrypted = true
  kms_key_id        = module.kms.key_arn

  db_name  = "wagtail"
  username = "wagtail"
  password = random_password.db_password.result

  # Multi-AZ for high availability
  multi_az = var.db_multi_az

  # Network configuration
  db_subnet_group_name   = aws_db_subnet_group.main.name
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds.id]

  # Backup configuration
  backup_retention_period = var.db_backup_retention_period
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:04:00-sun:05:00"

  # Enhanced monitoring
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  monitoring_interval             = 60
  monitoring_role_arn             = aws_iam_role.rds_monitoring.arn

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = module.kms.key_arn
  performance_insights_retention_period = 7

  # Deletion protection
  deletion_protection       = var.force_destroy
  skip_final_snapshot       = var.db_skip_final_snapshot
  final_snapshot_identifier = var.db_skip_final_snapshot ? null : "${local.csi}-final-snapshot-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"

  parameter_group_name = aws_db_parameter_group.main.name

  # Auto minor version upgrade
  auto_minor_version_upgrade = true

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-database"
    }
  )

  lifecycle {
    ignore_changes = [
      password,
      final_snapshot_identifier
    ]
  }
}
