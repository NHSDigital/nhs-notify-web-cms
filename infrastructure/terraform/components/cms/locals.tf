locals {
  aws_lambda_functions_dir_path = "../../../../lambdas"

  root_domain_name        = "${var.environment}.${local.acct.route53_zone_names[local.bc_name]}" # e.g. [main|dev|abxy0].cms.[dev|nonprod|prod].nhsnotify.national.nhs.uk
  root_domain_id          = local.acct.route53_zone_ids[local.bc_name]
  root_domain_nameservers = local.acct.route53_zone_nameservers[local.bc_name]

  log_destination_arn    = "arn:aws:logs:${var.region}:${var.shared_infra_account_id}:destination:nhs-${var.parent_acct_environment}-obs-firehose-logs"
  log_destination_arn_us = "arn:aws:logs:us-east-1:${var.shared_infra_account_id}:destination:nhs-${var.parent_acct_environment}-obs-us-east-1-firehose-logs"

  ecr_repository_url  = "${local.acct.ecr_repositories[local.bc_name].repository_url}-test" # TODO
  ecr_repository_name = local.acct.ecr_repositories[local.bc_name].name

  vpc_id          = local.acct.vpc_ids[local.bc_name]
  private_subnets = try(local.acct.private_subnets[local.bc_name], [])
  public_subnets  = try(local.acct.public_subnets[local.bc_name], [])
}
