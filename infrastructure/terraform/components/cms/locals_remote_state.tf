locals {
  acct = data.terraform_remote_state.acct.outputs
}

data "terraform_remote_state" "acct" {
  backend = "s3"

  config = {
    bucket = local.terraform_state_bucket

    key = format(
      "%s/%s/%s/%s/acct.tfstate",
      var.project,
      var.aws_account_id,
      "eu-west-2",
      var.parent_acct_environment
    )

    region = "eu-west-2"
  }
}
