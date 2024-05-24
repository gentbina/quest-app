module "random-app" {
  source = "./module"

  #ECS
  ecs_cluster_name       = "random-cluster-name"
  ecs_task_family        = "random-task-family"
  ecs_task_cpu           = "512"
  ecs_task_memory        = "1024"
  ecs_execution_role_arn = "arn:aws:iam::123456789012:role/randomTaskExecutionRole"
  container_name         = "random-container"
  container_image        = "123456789012.dkr.ecr.us-east-1.amazonaws.com/random-container:latest"
  container_port         = "8080"
  host_port              = "8080"
  env_variable           = "SECRET_KEY"
  env_variable_value     = "RandomValue123"
  ecs_service_name       = "random-service"
  desired_count          = "3"
  assing_public_ip       = true

  #Load Balancer
  lb_name              = "random-lb"
  lb_target_group_name = "random-tg"
  lb_target_group_port = "8080"
  lb_target_type       = "instance"

  #Security Groups
  ecs_sg_name = "random_ecs_security_group"
  alb_sg_name = "random_alb_security_group"

  ecs_ingress_ports = [
    { from_port = 8080, to_port = 8080, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]

  alb_ingress_ports = [
    { from_port = 80, to_port = 80, protocol = "tcp", cidr = "0.0.0.0/0" },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]

  egress_rules = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr = "0.0.0.0/0" }
  ]

  #IAM
  role_name = "randomTaskExecutionRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/RandomECSTaskExecutionRolePolicy"
  ]

  #Route53 and ACM
  domain_name             = "example.com"
  zone_id                 = "Z1234567890ABC"
  validation_method       = "DNS"
  record_type             = "A"
  evaluate_target_health  = false
  r53_cert_validation_ttl = 300

  #Providers Block
  region           = "us-east-1"
  account_id       = 123456789012
  deploy_role_name = "random-deploy-role"

  #VPC
  vpc_cidr = "10.0.0.0/16"

  subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster from the random module"
  value       = module.random-app.ecs_cluster_id
}

output "load_balancer_dns" {
  description = "The DNS name of the Load Balancer from the random module"
  value       = module.random-app.load_balancer_dns
}

output "route53_record_name" {
  description = "The name of the Route 53 record from the random module"
  value       = module.random-app.route53_record_name
}

output "certificate_arn" {
  description = "The ARN of the ACM certificate from the random module"
  value       = module.random-app.certificate_arn
}
