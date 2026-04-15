resource "aws_iam_role" "ecs_task_execution" {
  name_prefix = "${local.csi}-ecs-exec-"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-ecs-task-execution"
    }
  )
}

# AWS managed policy for ECS Task Execution Role (inline replica)
# Source: AmazonECSTaskExecutionRolePolicy
resource "aws_iam_role_policy" "ecs_task_execution_base" {
  name_prefix = "${local.csi}-ecs-exec-base-"
  role        = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "ecs_task_execution_secrets" {
  name_prefix = "${local.csi}-secrets-"
  role        = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ]
        Resource = [
          aws_ssm_parameter.db_password.arn,
          aws_ssm_parameter.redis_auth_token.arn,
          aws_ssm_parameter.django_secret_key.arn
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt",
          "kms:DescribeKey"
        ]
        Resource = [
          module.kms.key_arn,
          # local.acct.kms_key.arn           # Account KMS key for ECR images
        ]
      }
    ]
  })
}
