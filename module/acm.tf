resource "aws_acm_certificate" "app_cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.app_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }
  certificate_arn = aws_acm_certificate.app_cert.arn

  validation_record_fqdns = [
    aws_route53_record.cert_validation[each.key].fqdn
  ]
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.app_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  name    = each.value.name
  type    = each.value.type
  zone_id = var.zone_id
  records = [each.value.record]
  ttl     = var.r53_cert_validation_ttl
}
