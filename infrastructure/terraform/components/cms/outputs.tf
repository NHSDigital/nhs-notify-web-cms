##
# ECS Outputs
##

output "ecs_service_arn" {
  description = "ARN of the ECS Service"
  value       = aws_ecs_service.main.id
}

output "ecs_service_name" {
  description = "Name of the ECS Service"
  value       = aws_ecs_service.main.name
}

output "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  value       = aws_ecs_cluster.main.name
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "service_url" {
  description = "Service URL"
  value       = "https://${local.root_domain_name}"
}

##
# RDS Outputs
##

output "db_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

output "db_instance_address" {
  description = "RDS instance address"
  value       = aws_db_instance.main.address
}

output "db_instance_name" {
  description = "RDS database name"
  value       = aws_db_instance.main.db_name
}

output "db_password_parameter_arn" {
  description = "ARN of the SSM Parameter containing the database password"
  value       = aws_ssm_parameter.db_password.arn
}

##
# ElastiCache Outputs
##

output "redis_endpoint" {
  description = "ElastiCache Valkey Serverless endpoint"
  value       = aws_elasticache_serverless_cache.main.endpoint[0].address
  sensitive   = true
}

output "redis_port" {
  description = "ElastiCache Valkey Serverless port"
  value       = aws_elasticache_serverless_cache.main.endpoint[0].port
}

output "redis_auth_token_parameter_arn" {
  description = "ARN of the SSM Parameter containing the Redis auth token"
  value       = aws_ssm_parameter.redis_auth_token.arn
}

##
# S3 Outputs
##

output "media_bucket_name" {
  description = "S3 bucket name for media files"
  value       = module.s3bucket_media.bucket
}

output "media_bucket_arn" {
  description = "S3 bucket ARN for media files"
  value       = module.s3bucket_media.arn
}

##
# DNS Outputs
##

output "cms_dns_name" {
  description = "DNS name for the Wagtail CMS application"
  value       = aws_route53_record.main.fqdn
}

output "cms_url" {
  description = "Full HTTPS URL for the Wagtail CMS application"
  value       = "https://${aws_route53_record.main.fqdn}"
}
