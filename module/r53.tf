resource "aws_route53_record" "app" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = var.record_type
  alias {
    name                   = aws_lb.app.dns_name
    zone_id                = aws_lb.app.zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}
