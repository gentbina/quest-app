output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = aws_ecs_cluster.app.id
}
output "load_balancer_dns" {
  value = aws_lb.app.dns_name
}
output "route53_record_name" {
  value = aws_route53_record.app.name
}
output "certificate_arn" {
  value = aws_acm_certificate.app_cert.arn
}
