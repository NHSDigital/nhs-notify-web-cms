resource "aws_ecs_service" "main" {
  name            = "${local.csi}-a"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  launch_type     = "FARGATE"
  desired_count   = var.ecs_min_capacity

  enable_execute_command = true

  network_configuration {
    subnets          = local.private_subnets
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "wagtail"
    container_port   = 8080
  }

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  wait_for_steady_state = false

  depends_on = [
    aws_lb_listener.https,
    aws_iam_role_policy.ecs_task_execution_base
  ]

  tags = merge(
    local.default_tags,
    {
      Name = local.csi
    }
  )
}
