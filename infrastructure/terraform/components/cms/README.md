<!-- BEGIN_TF_DOCS -->
<!-- markdownlint-disable -->
<!-- vale off -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.23.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS Account ID (numeric) | `string` | n/a | yes |
| <a name="input_cache_snapshot_retention_limit"></a> [cache\_snapshot\_retention\_limit](#input\_cache\_snapshot\_retention\_limit) | Number of days to retain ElastiCache snapshots | `number` | `5` | no |
| <a name="input_container_image_tag_suffix"></a> [container\_image\_tag\_suffix](#input\_container\_image\_tag\_suffix) | Suffix used for container/image based Lambda image tags | `string` | `"latest"` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | Allocated storage for RDS in GB | `number` | `20` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | Backup retention period in days for RDS | `number` | `7` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | RDS instance class for PostgreSQL database | `string` | `"db.t4g.micro"` | no |
| <a name="input_db_multi_az"></a> [db\_multi\_az](#input\_db\_multi\_az) | Enable Multi-AZ deployment for RDS | `bool` | `false` | no |
| <a name="input_db_skip_final_snapshot"></a> [db\_skip\_final\_snapshot](#input\_db\_skip\_final\_snapshot) | Skip final snapshot when deleting RDS instance | `bool` | `false` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to apply to all taggable resources within the component | `map(string)` | `{}` | no |
| <a name="input_ecs_max_capacity"></a> [ecs\_max\_capacity](#input\_ecs\_max\_capacity) | Maximum number of ECS tasks for auto-scaling | `number` | `10` | no |
| <a name="input_ecs_min_capacity"></a> [ecs\_min\_capacity](#input\_ecs\_min\_capacity) | Minimum number of ECS tasks | `number` | `2` | no |
| <a name="input_ecs_task_cpu"></a> [ecs\_task\_cpu](#input\_ecs\_task\_cpu) | CPU units for ECS task (256, 512, 1024, 2048, 4096) | `string` | `"512"` | no |
| <a name="input_ecs_task_memory"></a> [ecs\_task\_memory](#input\_ecs\_task\_memory) | Memory for ECS task in MiB (512, 1024, 2048, 3072, 4096, 5120, 6144, 7168, 8192) | `string` | `"1024"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the tfscaffold environment | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Flag to force deletion of S3 buckets | `bool` | `false` | no |
| <a name="input_force_lambda_code_deploy"></a> [force\_lambda\_code\_deploy](#input\_force\_lambda\_code\_deploy) | If the lambda package in s3 has the same commit id tag as the terraform build branch, the lambda will not update automatically. Set to True if making changes to Lambda code from on the same commit for example during development | `bool` | `false` | no |
| <a name="input_group"></a> [group](#input\_group) | The group variables are being inherited from (often synonmous with account short-name) | `string` | n/a | yes |
| <a name="input_kms_deletion_window"></a> [kms\_deletion\_window](#input\_kms\_deletion\_window) | When a kms key is deleted, how long should it wait in the pending deletion state? | `string` | `"30"` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | The log level to be used in lambda functions within the component. Any log with a lower severity than the configured value will not be logged: https://docs.python.org/3/library/logging.html#levels | `string` | `"INFO"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The retention period in days for the Cloudwatch Logs events to be retained, default of 0 is indefinite | `number` | `0` | no |
| <a name="input_parent_acct_environment"></a> [parent\_acct\_environment](#input\_parent\_acct\_environment) | Name of the environment responsible for the acct resources used, affects things like DNS zone. Useful for named dev environments | `string` | `"main"` | no |
| <a name="input_project"></a> [project](#input\_project) | The name of the tfscaffold project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS Region | `string` | n/a | yes |
| <a name="input_shared_infra_account_id"></a> [shared\_infra\_account\_id](#input\_shared\_infra\_account\_id) | The AWS Account ID of the shared infrastructure account | `string` | `"000000000000"` | no |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | https://github.com/NHSDigital/nhs-notify-shared-modules/releases/download/3.0.6/terraform-kms.zip | n/a |
| <a name="module_s3bucket_media"></a> [s3bucket\_media](#module\_s3bucket\_media) | https://github.com/NHSDigital/nhs-notify-shared-modules/releases/download/3.0.6/terraform-s3bucket.zip | n/a |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of the Application Load Balancer |
| <a name="output_cms_dns_name"></a> [cms\_dns\_name](#output\_cms\_dns\_name) | DNS name for the Wagtail CMS application |
| <a name="output_cms_url"></a> [cms\_url](#output\_cms\_url) | Full HTTPS URL for the Wagtail CMS application |
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | RDS instance address |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | RDS instance endpoint |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | RDS database name |
| <a name="output_db_password_parameter_arn"></a> [db\_password\_parameter\_arn](#output\_db\_password\_parameter\_arn) | ARN of the SSM Parameter containing the database password |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | Name of the ECS Cluster |
| <a name="output_ecs_service_arn"></a> [ecs\_service\_arn](#output\_ecs\_service\_arn) | ARN of the ECS Service |
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | Name of the ECS Service |
| <a name="output_media_bucket_arn"></a> [media\_bucket\_arn](#output\_media\_bucket\_arn) | S3 bucket ARN for media files |
| <a name="output_media_bucket_name"></a> [media\_bucket\_name](#output\_media\_bucket\_name) | S3 bucket name for media files |
| <a name="output_redis_auth_token_parameter_arn"></a> [redis\_auth\_token\_parameter\_arn](#output\_redis\_auth\_token\_parameter\_arn) | ARN of the SSM Parameter containing the Redis auth token |
| <a name="output_redis_endpoint"></a> [redis\_endpoint](#output\_redis\_endpoint) | ElastiCache Valkey Serverless endpoint |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | ElastiCache Valkey Serverless port |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | Service URL |
<!-- vale on -->
<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->
