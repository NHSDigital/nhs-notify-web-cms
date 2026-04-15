resource "aws_iam_role" "ecs_infrastructure" {
  name_prefix = "${local.csi}-ecs-infra-"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    local.default_tags,
    {
      Name = "${local.csi}-ecs-infrastructure"
    }
  )
}

# AWS managed policy for Express Gateway Services (inline replica)
# Source: AmazonECSInfrastructureRoleforExpressGatewayServices
resource "aws_iam_role_policy" "ecs_infrastructure_express_gateway_replica" {
  name_prefix = "${local.csi}-express-gateway-"
  role        = aws_iam_role.ecs_infrastructure.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ServiceLinkedRoleCreateOperations"
        Effect = "Allow"
        Action = "iam:CreateServiceLinkedRole"
        Resource = "*"
        Condition = {
          StringEquals = {
            "iam:AWSServiceName" = [
              "ecs.application-autoscaling.amazonaws.com",
              "elasticloadbalancing.amazonaws.com"
            ]
          }
        }
      },
      {
        Sid    = "ELBCreateOperations"
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:CreateListener",
          "elasticloadbalancing:CreateLoadBalancer",
          "elasticloadbalancing:CreateRule",
          "elasticloadbalancing:CreateTargetGroup"
        ]
        Resource = [
          "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
        ]
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "ELBModifyDeleteOperations"
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:ModifyListener",
          "elasticloadbalancing:ModifyRule",
          "elasticloadbalancing:AddListenerCertificates",
          "elasticloadbalancing:RemoveListenerCertificates",
          "elasticloadbalancing:RegisterTargets",
          "elasticloadbalancing:DeregisterTargets",
          "elasticloadbalancing:DeleteTargetGroup",
          "elasticloadbalancing:DeleteLoadBalancer",
          "elasticloadbalancing:DeleteRule",
          "elasticloadbalancing:DeleteListener"
        ]
        Resource = [
          "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
        ]
        Condition = {
          StringEquals = {
            "aws:ResourceTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "TagOnCreateELBResources"
        Effect = "Allow"
        Action = "elasticloadbalancing:AddTags"
        Resource = [
          "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*/*",
          "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
        ]
        Condition = {
          StringEquals = {
            "elasticloadbalancing:CreateAction" = [
              "CreateLoadBalancer",
              "CreateListener",
              "CreateRule",
              "CreateTargetGroup"
            ]
          }
        }
      },
      {
        Sid      = "BlanketAllowCreateSecurityGroupsInVPCs"
        Effect   = "Allow"
        Action   = "ec2:CreateSecurityGroup"
        Resource = "arn:aws:ec2:*:*:vpc/*"
      },
      {
        Sid    = "CreateSecurityGroupResourcesWithTags"
        Effect = "Allow"
        Action = [
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress"
        ]
        Resource = [
          "arn:aws:ec2:*:*:security-group/*",
          "arn:aws:ec2:*:*:security-group-rule/*",
          "arn:aws:ec2:*:*:vpc/*"
        ]
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "ModifySecurityGroupRules"
        Effect = "Allow"
        Action = [
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress"
        ]
        Resource = "arn:aws:ec2:*:*:security-group/*"
      },
      {
        Sid    = "DeleteManagedSecurityGroups"
        Effect = "Allow"
        Action = "ec2:DeleteSecurityGroup"
        Resource = "arn:aws:ec2:*:*:security-group/*"
        Condition = {
          StringEquals = {
            "aws:ResourceTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "ModifyVPCForSecurityGroups"
        Effect = "Allow"
        Action = [
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress"
        ]
        Resource = "arn:aws:ec2:*:*:vpc/*"
      },
      {
        Sid    = "TagOnCreateEC2Resources"
        Effect = "Allow"
        Action = "ec2:CreateTags"
        Resource = [
          "arn:aws:ec2:*:*:security-group/*",
          "arn:aws:ec2:*:*:security-group-rule/*"
        ]
        Condition = {
          StringEquals = {
            "ec2:CreateAction" = [
              "CreateSecurityGroup",
              "AuthorizeSecurityGroupIngress",
              "AuthorizeSecurityGroupEgress"
            ]
          }
        }
      },
      {
        Sid    = "CertificateCreateOperations"
        Effect = "Allow"
        Action = [
          "acm:RequestCertificate",
          "acm:AddTagsToCertificate"
        ]
        Resource = "arn:aws:acm:*:*:certificate/*"
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "CertificateDeleteOperations"
        Effect = "Allow"
        Action = [
          "acm:DeleteCertificate",
          "acm:DescribeCertificate"
        ]
        Resource = "arn:aws:acm:*:*:certificate/*"
        Condition = {
          StringEquals = {
            "aws:ResourceTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "ApplicationAutoscalingCreateOperations"
        Effect = "Allow"
        Action = [
          "application-autoscaling:RegisterScalableTarget",
          "application-autoscaling:TagResource"
        ]
        Resource = "arn:aws:application-autoscaling:*:*:scalable-target/*"
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "ApplicationAutoscalingDeregisterOperations"
        Effect = "Allow"
        Action = "application-autoscaling:DeregisterScalableTarget"
        Resource = "arn:aws:application-autoscaling:*:*:scalable-target/*"
      },
      {
        Sid    = "ApplicationAutoscalingPolicyOperations"
        Effect = "Allow"
        Action = [
          "application-autoscaling:PutScalingPolicy",
          "application-autoscaling:DeleteScalingPolicy"
        ]
        Resource = "arn:aws:application-autoscaling:*:*:scalable-target/*"
        Condition = {
          StringEquals = {
            "application-autoscaling:service-namespace" = "ecs"
          }
        }
      },
      {
        Sid    = "ApplicationAutoscalingReadOperations"
        Effect = "Allow"
        Action = [
          "application-autoscaling:DescribeScalableTargets",
          "application-autoscaling:DescribeScalingPolicies",
          "application-autoscaling:DescribeScalingActivities"
        ]
        Resource = "arn:aws:application-autoscaling:*:*:scalable-target/*"
      },
      {
        Sid    = "ECSServiceOperations"
        Effect = "Allow"
        Action = [
          "ecs:DescribeServices",
          "ecs:UpdateService"
        ]
        Resource = "arn:aws:ecs:*:*:service/*/*"
      },
      {
        Sid    = "CloudWatchAlarmCreateOperations"
        Effect = "Allow"
        Action = [
          "cloudwatch:PutMetricAlarm",
          "cloudwatch:TagResource"
        ]
        Resource = "arn:aws:cloudwatch:*:*:alarm:*"
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid    = "CloudWatchAlarmDeleteOperations"
        Effect = "Allow"
        Action = "cloudwatch:DeleteAlarms"
        Resource = "arn:aws:cloudwatch:*:*:alarm:*"
      },
      {
        Sid      = "CloudWatchAlarmReadOperations"
        Effect   = "Allow"
        Action   = "cloudwatch:DescribeAlarms"
        Resource = "*"
      },
      {
        Sid    = "ELBReadOperations"
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeTargetHealth",
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:DescribeRules"
        ]
        Resource = "*"
      },
      {
        Sid    = "VPCReadOperations"
        Effect = "Allow"
        Action = [
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeRouteTables",
          "ec2:DescribeVpcs"
        ]
        Resource = "*"
      },
      {
        Sid    = "CloudWatchLogsCreateOperations"
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:TagResource"
        ]
        Resource = "arn:aws:logs:*:*:log-group:*"
        Condition = {
          StringEquals = {
            "aws:RequestTag/AmazonECSManaged" = "true"
          }
        }
      },
      {
        Sid      = "CloudWatchLogsReadOperations"
        Effect   = "Allow"
        Action   = "logs:DescribeLogGroups"
        Resource = "*"
      }
    ]
  })
}

# TODO: Remove once Express Gateway is working - kept for reference
resource "aws_iam_role_policy" "ecs_infrastructure_express" {
  name_prefix = "${local.csi}-express-"
  role        = aws_iam_role.ecs_infrastructure.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeRouteTables",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeVpcs",
          "ec2:CreateSecurityGroup",
          "ec2:DeleteSecurityGroup",
          "ec2:DescribeAccountAttributes",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:CreateTags",
          "elasticloadbalancing:CreateLoadBalancer",
          "elasticloadbalancing:CreateTargetGroup",
          "elasticloadbalancing:CreateListener",
          "elasticloadbalancing:DeleteLoadBalancer",
          "elasticloadbalancing:DeleteTargetGroup",
          "elasticloadbalancing:DeleteListener",
          "elasticloadbalancing:Describe*",
          "elasticloadbalancing:ModifyLoadBalancerAttributes",
          "elasticloadbalancing:ModifyTargetGroup",
          "elasticloadbalancing:ModifyTargetGroupAttributes",
          "elasticloadbalancing:RegisterTargets",
          "elasticloadbalancing:DeregisterTargets",
          "elasticloadbalancing:AddTags"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:DescribeLogGroups",
          "logs:PutRetentionPolicy",
          "logs:TagLogGroup"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "application-autoscaling:RegisterScalableTarget",
          "application-autoscaling:DeregisterScalableTarget",
          "application-autoscaling:DescribeScalableTargets",
          "application-autoscaling:PutScalingPolicy",
          "application-autoscaling:DeleteScalingPolicy",
          "application-autoscaling:DescribeScalingPolicies",
          "application-autoscaling:DescribeScalingActivities",
          "application-autoscaling:TagResource"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:PutMetricAlarm",
          "cloudwatch:DeleteAlarms",
          "cloudwatch:DescribeAlarms"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = "iam:CreateServiceLinkedRole"
        Resource = [
          "arn:aws:iam::*:role/aws-service-role/elasticloadbalancing.amazonaws.com/AWSServiceRoleForElasticLoadBalancing",
          "arn:aws:iam::*:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"
        ]
        Condition = {
          StringLike = {
            "iam:AWSServiceName" = [
              "elasticloadbalancing.amazonaws.com",
              "ecs.application-autoscaling.amazonaws.com"
            ]
          }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "acm:RequestCertificate",
          "acm:DescribeCertificate",
          "acm:DeleteCertificate",
          "acm:AddTagsToCertificate",
          "acm:ListTagsForCertificate"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:GetChange",
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ]
        Resource = "*"
      }
    ]
  })
}
