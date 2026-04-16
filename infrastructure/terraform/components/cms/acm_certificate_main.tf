resource "aws_acm_certificate" "main" {
  domain_name       = local.root_domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.default_tags,
    {
      Name = local.csi
    }
  )
}
