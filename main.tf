module "quest-app" {
  source = "./module"

  #ECS
  ecs_cluster_name       = "quest-app-cluster"
  ecs_task_family        = "quest-app-task"
  ecs_task_cpu           = "1024"
  ecs_task_memory        = "2048"
  ecs_execution_role_arn = "arn:aws:iam::191600387477:role/ecsTaskExecutionRole"
  container_name         = "quest-app"
  container_image        = "191600387477.dkr.ecr.us-east-1.amazonaws.com/quest-app:latest"
  container_port         = "3000"
  host_port              = "3000"
  env_variable           = "SECRET_WORD"
  env_variable_value     = "TwelveFactor"
  ecs_service_name       = "quest-app-service"
  desired_count          = "2"
  assing_public_ip       = true

  #Load Balancer
  lb_name              = "quest-app-lb"
  lb_target_group_name = "quest-app-tg"
  lb_target_group_port = "3000"
  lb_target_type       = "ip"

  #Security Groups
  ecs_sg_name = "ecs_security_group"
  alb_sg_name = "alb_security_group"

  ecs_ingress_ports = [
    { from_port = 3000, to_port = 3000, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]

  alb_ingress_ports = [
    { from_port = 80, to_port = 80, protocol = "tcp", cidr = "0.0.0.0/0" },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr = "0.0.0.0/0" }
  ]

  egress_rules = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr = "0.0.0.0/0" }
  ]

  #IAM
  role_name = "ecsTaskExecutionRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]

  #Route53 and ACM
  domain_name             = "test.gentbina.com"
  zone_id                 = "ZFAKQT1VB7ZSE"
  validation_method       = "DNS"
  record_type             = "A"
  evaluate_target_health  = true
  r53_cert_validation_ttl = 60

  #Providers Block
  region           = "us-east-1"
  account_id       = 191600387477
  deploy_role_name = "terraform-deploy"

  #VPC
  vpc_cidr = "10.0.0.0/16"

  subnet_cidrs = [
    "10.0.0.0/24",
    "10.0.1.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster from the qust-app module"
  value       = module.quest-app.ecs_cluster_id
}

output "load_balancer_dns" {
  description = "The DNS name of the Load Balancer from the qust-app module"
  value       = module.quest-app.load_balancer_dns
}

output "route53_record_name" {
  description = "The name of the Route 53 record from the qust-app module"
  value       = module.quest-app.route53_record_name
}

output "certificate_arn" {
  description = "The ARN of the ACM certificate from the qust-app module"
  value       = module.quest-app.certificate_arn
}
