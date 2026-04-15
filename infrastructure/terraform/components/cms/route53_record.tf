resource "aws_route53_record" "main" {
  zone_id = local.root_domain_id
  name    = local.root_domain_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_ecs_express_gateway_service.main.ingress_paths[0].endpoint]

  depends_on = [aws_ecs_express_gateway_service.main]
}
