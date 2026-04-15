module "kms" {
  source = "https://github.com/NHSDigital/nhs-notify-shared-modules/releases/download/3.0.6/terraform-kms.zip"

  aws_account_id = var.aws_account_id
  component      = local.component
  environment    = var.environment
  project        = var.project
  region         = var.region

  name                 = "main"
  deletion_window      = var.kms_deletion_window
  alias                = "alias/${local.csi}"
  key_policy_documents = [data.aws_iam_policy_document.kms.json]
  iam_delegation       = true
}

data "aws_iam_policy_document" "kms" {
  # '*' resource scope is permitted in access policies as as the resource is itself
  # https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-services.html

  statement {
    sid    = "AllowCloudWatchLogsEncrypt"
    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "sns.amazonaws.com",
        "logs.${var.region}.amazonaws.com",
      ]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey",
      "kms:DescribeKey"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowEventsFromSharedInfraAccount"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.shared_infra_account_id}:root"]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowRDSToUseKey"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey",
      "kms:CreateGrant",
      "kms:DescribeKey"
    ]

    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "kms:ViaService"
      values   = ["rds.${var.region}.amazonaws.com"]
    }
  }

  statement {
    sid    = "AllowElastiCacheToUseKey"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["elasticache.amazonaws.com"]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey",
      "kms:CreateGrant",
      "kms:DescribeKey"
    ]

    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "kms:ViaService"
      values   = ["elasticache.${var.region}.amazonaws.com"]
    }
  }
}
