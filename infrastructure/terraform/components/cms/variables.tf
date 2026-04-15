##
# Basic Required Variables for tfscaffold Components
##

variable "project" {
  type        = string
  description = "The name of the tfscaffold project"
}

variable "environment" {
  type        = string
  description = "The name of the tfscaffold environment"
}

variable "aws_account_id" {
  type        = string
  description = "The AWS Account ID (numeric)"
}

variable "region" {
  type        = string
  description = "The AWS Region"
}

variable "group" {
  type        = string
  description = "The group variables are being inherited from (often synonmous with account short-name)"
}

##
# tfscaffold variables specific to this component
##

# This is the only primary variable to have its value defined as
# a default within its declaration in this file, because the variables
# purpose is as an identifier unique to this component, rather
# then to the environment from where all other variables come.

variable "default_tags" {
  type        = map(string)
  description = "A map of default tags to apply to all taggable resources within the component"
  default     = {}
}

##
# Variables specific to the component
##

variable "force_destroy" {
  type        = bool
  description = "Flag to force deletion of S3 buckets"
  default     = false
}

variable "force_lambda_code_deploy" {
  type        = bool
  description = "If the lambda package in s3 has the same commit id tag as the terraform build branch, the lambda will not update automatically. Set to True if making changes to Lambda code from on the same commit for example during development"
  default     = false
}

variable "kms_deletion_window" {
  type        = string
  description = "When a kms key is deleted, how long should it wait in the pending deletion state?"
  default     = "30"
}

variable "log_level" {
  type        = string
  description = "The log level to be used in lambda functions within the component. Any log with a lower severity than the configured value will not be logged: https://docs.python.org/3/library/logging.html#levels"
  default     = "INFO"
}

variable "log_retention_in_days" {
  type        = number
  description = "The retention period in days for the Cloudwatch Logs events to be retained, default of 0 is indefinite"
  default     = 0
}

variable "parent_acct_environment" {
  type        = string
  description = "Name of the environment responsible for the acct resources used, affects things like DNS zone. Useful for named dev environments"
  default     = "main"
}

variable "shared_infra_account_id" {
  type        = string
  description = "The AWS Account ID of the shared infrastructure account"
  default     = "000000000000"
}

##
# CMS Infrastructure Variables
##

# RDS PostgreSQL Variables
variable "db_instance_class" {
  type        = string
  description = "RDS instance class for PostgreSQL database"
  default     = "db.t4g.micro"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage for RDS in GB"
  default     = 20
}

variable "db_multi_az" {
  type        = bool
  description = "Enable Multi-AZ deployment for RDS"
  default     = false
}

variable "db_backup_retention_period" {
  type        = number
  description = "Backup retention period in days for RDS"
  default     = 7
}

variable "db_skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot when deleting RDS instance"
  default     = false
}

# ElastiCache Valkey Serverless Variables
# Note: cache_node_type and cache_num_nodes not needed for serverless

variable "cache_snapshot_retention_limit" {
  type        = number
  description = "Number of days to retain ElastiCache snapshots"
  default     = 5
}

# ECS Variables
variable "ecs_task_cpu" {
  type        = string
  description = "CPU units for ECS task (256, 512, 1024, 2048, 4096)"
  default     = "512"
}

variable "ecs_task_memory" {
  type        = string
  description = "Memory for ECS task in MiB (512, 1024, 2048, 3072, 4096, 5120, 6144, 7168, 8192)"
  default     = "1024"
}

variable "ecs_min_capacity" {
  type        = number
  description = "Minimum number of ECS tasks"
  default     = 2
}

variable "ecs_max_capacity" {
  type        = number
  description = "Maximum number of ECS tasks for auto-scaling"
  default     = 10
}

variable "container_image_tag_suffix" {
  type        = string
  description = "Suffix used for container/image based Lambda image tags"
  default     = "latest"
}
