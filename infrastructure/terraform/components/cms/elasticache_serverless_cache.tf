resource "aws_elasticache_serverless_cache" "main" {
  name        = "${local.csi}-cache"
  description = "Valkey Serverless cache for Wagtail CMS"
  engine      = "valkey"

  # Serverless capacity configuration
  cache_usage_limits {
    data_storage {
      maximum = 10 # GB
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 5000
    }
  }

  subnet_ids         = local.private_subnets
  security_group_ids = [aws_security_group.elasticache.id]

  daily_snapshot_time      = "05:00"
  snapshot_retention_limit = var.cache_snapshot_retention_limit

  kms_key_id    = module.kms.key_arn
  user_group_id = aws_elasticache_user_group.main.id

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-valkey-serverless"
    }
  )
} 

# Create Valkey user for authentication
resource "aws_elasticache_user" "main" {
  user_id       = "${local.csi}-cache-user"
  user_name     = "default"
  access_string = "on ~* +@all"
  engine        = "valkey"

  authentication_mode {
    type      = "password"
    passwords = [random_password.redis_auth_token.result]
  }

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-valkey-user"
    }
  )

  lifecycle {
    ignore_changes = [authentication_mode]
  }
}

# Create user group for serverless cache
resource "aws_elasticache_user_group" "main" {
  user_group_id = "${local.csi}-cache-users"
  engine        = "valkey"
  user_ids      = [aws_elasticache_user.main.user_id]

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-valkey-user-group"
    }
  )

  lifecycle {
    ignore_changes = [user_ids]
  }
}
