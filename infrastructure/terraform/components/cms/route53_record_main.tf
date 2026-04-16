resource "aws_route53_record" "main" {
  zone_id = local.root_domain_id
  name    = local.root_domain_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main.dns_name]

  depends_on = [aws_lb.main]
}
