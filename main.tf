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
  secret_word            = "SECRET_WORD"
  secret_word_value      = "TwelveFactor"
  ecs_service_name       = "quest-app-service"
  desired_count          = "2"

  #Load Balancer
  lb_name                       = "quest-app-lb"
  lb_internal                   = "false"
  lb_type                       = "application"
  lb_target_group_name          = "quest-app-tg"
  lb_target_group_port          = "3000"
  lb_target_group_protocol      = "HTTP"
  lb_target_type                = "ip"
  lb_listener_port              = "80"
  lb_listener_protocol          = "HTTP"
  lb_listener_action_type       = "redirect"
  lb_listener_port_https        = "443"
  lb_listener_protocol_https    = "HTTPS"
  lb_listener_action_type_https = "forward"

  #Security Groups

  #IAM

  #Route53 and ACM
  domain_name = "test.gentbina.com"



}
