locals {
  component = "cms"
  bc_name   = "web-cms"

  terraform_state_bucket = format(
    "%s-tfscaffold-%s-%s",
    var.project,
    var.aws_account_id,
    var.region,
  )

  csi = replace(
    format(
      "%s-%s-%s",
      var.project,
      var.environment,
      local.component,
    ),
    "_",
    "",
  )

  # CSI for use in resources with a global namespace, i.e. S3 Buckets
  csi_global = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.aws_account_id,
      var.region,
      var.environment,
      local.component,
    ),
    "_",
    "",
  )

  default_tags = merge(
    var.default_tags,
    {
      Project     = var.project
      Environment = var.environment
      Component   = local.component
      Group       = var.group
      Name        = local.csi
    },
  )
}
