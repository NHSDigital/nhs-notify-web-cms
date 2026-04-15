resource "aws_ecs_express_gateway_service" "main" {
  service_name = local.csi
  cluster      = aws_ecs_cluster.main.name

  execution_role_arn      = aws_iam_role.ecs_task_execution.arn
  infrastructure_role_arn = aws_iam_role.ecs_infrastructure.arn
  task_role_arn           = aws_iam_role.ecs_task.arn

  cpu    = var.ecs_task_cpu
  memory = var.ecs_task_memory
  health_check_path = "/health/"

  primary_container {
    image          = "${local.ecr_repository_url}:${var.project}-${var.environment}-${local.component}-wagtail-${var.container_image_tag_suffix}"
    container_port = 8080

    aws_logs_configuration {
      log_group         = aws_cloudwatch_log_group.ecs.name
      log_stream_prefix = "wagtail"
    }

    environment {
      name  = "DJANGO_SETTINGS_MODULE"
      value = "config.settings.production"
    }

    environment {
      name  = "DATABASE_HOST"
      value = aws_db_instance.main.address
    }

    environment {
      name  = "DATABASE_PORT"
      value = tostring(aws_db_instance.main.port)
    }

    environment {
      name  = "DATABASE_NAME"
      value = aws_db_instance.main.db_name
    }

    environment {
      name  = "DATABASE_USER"
      value = aws_db_instance.main.username
    }

    environment {
      name  = "REDIS_HOST"
      value = aws_elasticache_serverless_cache.main.endpoint[0].address
    }

    environment {
      name  = "REDIS_PORT"
      value = tostring(aws_elasticache_serverless_cache.main.endpoint[0].port)
    }

    environment {
      name  = "REDIS_SSL"
      value = "true"
    }

    environment {
      name  = "AWS_STORAGE_BUCKET_NAME"
      value = module.s3bucket_media.bucket
    }

    environment {
      name  = "AWS_S3_REGION_NAME"
      value = var.region
    }

    environment {
      name  = "ALLOWED_HOSTS"
      value = local.root_domain_name
    }

    # Secrets from SSM Parameter Store
    secret {
      name       = "DATABASE_PASSWORD"
      value_from = aws_ssm_parameter.db_password.arn
    }

    secret {
      name       = "REDIS_AUTH_TOKEN"
      value_from = aws_ssm_parameter.redis_auth_token.arn
    }

    secret {
      name       = "DJANGO_SECRET_KEY"
      value_from = aws_ssm_parameter.django_secret_key.arn
    }
  }

  network_configuration {
    subnets         = local.private_subnets
    security_groups = [aws_security_group.ecs_tasks.id]
  }

  scaling_target {
    min_task_count            = var.ecs_min_capacity
    max_task_count            = var.ecs_max_capacity
    auto_scaling_metric       = "AVERAGE_CPU"
    auto_scaling_target_value = 70
  }

  wait_for_steady_state = false

  tags = merge(
    local.default_tags,
    {
      Name = local.csi
    }
  )
}
