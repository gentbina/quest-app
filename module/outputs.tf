output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = aws_ecs_cluster.app.id
}
output "load_balancer_dns" {
  description = "The DNS name of the Load Balancer"
  value       = aws_lb.app.dns_name
}
output "route53_record_name" {
  description = "The name of the Route 53 record"
  value       = aws_route53_record.app.name
}
output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.app_cert.arn
}
