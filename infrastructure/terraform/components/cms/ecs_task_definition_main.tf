resource "aws_ecs_task_definition" "main" {
  family                   = local.csi
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name      = "wagtail"
      image     = "${local.ecr_repository_url}:${var.project}-${var.environment}-${local.component}-wagtail-${var.container_image_tag_suffix}"
      essential = true

      portMappings = [
        {
          containerPort = 8080
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "DJANGO_SETTINGS_MODULE"
          value = "cms.settings.production"
        },
        {
          name  = "DATABASE_HOST"
          value = aws_db_instance.main.address
        },
        {
          name  = "DATABASE_PORT"
          value = tostring(aws_db_instance.main.port)
        },
        {
          name  = "DATABASE_NAME"
          value = aws_db_instance.main.db_name
        },
        {
          name  = "DATABASE_USER"
          value = aws_db_instance.main.username
        },
        {
          name  = "REDIS_HOST"
          value = aws_elasticache_serverless_cache.main.endpoint[0].address
        },
        {
          name  = "REDIS_PORT"
          value = tostring(aws_elasticache_serverless_cache.main.endpoint[0].port)
        },
        {
          name  = "REDIS_SSL"
          value = "true"
        },
        {
          name  = "AWS_STORAGE_BUCKET_NAME"
          value = module.s3bucket_media.bucket
        },
        {
          name  = "AWS_S3_REGION_NAME"
          value = var.region
        },
        {
          name  = "ALLOWED_HOSTS"
          value = "${local.root_domain_name},*"
        },
        {
          name  = "CSRF_TRUSTED_ORIGINS"
          value = "https://${local.root_domain_name}"
        }
      ]

      secrets = [
        {
          name      = "DATABASE_PASSWORD"
          valueFrom = aws_ssm_parameter.db_password.arn
        },
        {
          name      = "REDIS_AUTH_TOKEN"
          valueFrom = aws_ssm_parameter.redis_auth_token.arn
        },
        {
          name      = "DJANGO_SECRET_KEY"
          valueFrom = aws_ssm_parameter.django_secret_key.arn
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "wagtail"
        }
      }
    }
  ])

  tags = merge(
    local.default_tags,
    {
      Name = local.csi
    }
  )
}
