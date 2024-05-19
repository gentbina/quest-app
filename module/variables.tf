# ECS Variables
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}
variable "ecs_task_family" {
  description = "Family of the ECS task definition"
  type        = string
}
variable "requires_compatibilities" {
  description = "Required compatibility for ECS, Fargate being default"
  type        = list(string)
  default     = ["FARGATE"]
}
variable "ecs_task_cpu" {
  description = "CPU units for the ECS task"
  type        = string
}
variable "ecs_task_memory" {
  description = "Memory for the ECS task"
  type        = string
}
variable "ecs_execution_role_arn" {
  description = "ARN of the execution role for ECS tasks"
  type        = string
}
variable "container_name" {
  description = "Name of the container"
  type        = string
}
variable "container_image" {
  description = "Container image to use"
  type        = string
}
variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}
variable "host_port" {
  description = "Host Port"
  type        = number
}
variable "env_variable" {
  description = "Set some sort of environmental variable"
  type        = string
}
variable "env_variable_value" {
  description = "Value to the env variable"
  type        = string
}
variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}
variable "operating_system_family" {
  description = "Operating system family for Fargate"
  type        = string
  default     = "LINUX"
}
variable "cpu_architecture" {
  description = "CPU architecture for Fargate"
  type        = string
  default     = "X86_64"
}
variable "fargate_network_mode" {
  description = "Fargate network mode"
  type        = string
  default     = "awsvpc"
}
variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
}
variable "assing_public_ip" {
  description = "Assign public IP to ECS service"
  type        = bool
}
variable "launch_type" {
  description = "Launch type for ECS service"
  type        = string
  default     = "FARGATE"
}
variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}
#===========================================================================
#Load Balancer
variable "lb_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}
variable "lb_type" {
  description = "Type of the load balancer"
  type        = string
  default     = "application"
}
variable "lb_target_group_name" {
  description = "Name of the load balancer target group"
  type        = string
}
variable "lb_target_group_port" {
  description = "Port of the load balancer target group"
  type        = number
  default     = "80"
}
variable "lb_target_group_protocol" {
  description = "Protocol of the load balancer target group"
  type        = string
  default     = "HTTP"
}
variable "lb_target_type" {
  description = "Target type of the load balancer"
  type        = string
  default     = "ip"
}
variable "health_check" {
  type = object({
    path                = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
  })
  default = {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
variable "lb_listener_port" {
  description = "Port for the load balancer listener"
  type        = number
  default     = "80"
}
variable "lb_listener_protocol" {
  description = "Protocol for the load balancer listener"
  type        = string
  default     = "HTTP"
}
variable "lb_listener_action_type" {
  description = "Action type for the load balancer listener"
  type        = string
  default     = "redirect"
}
variable "lb_listener_port_https" {
  description = "Port for the load balancer listener"
  type        = number
  default     = "443"
}
variable "lb_listener_protocol_https" {
  description = "Protocol for the load balancer listener"
  type        = string
  default     = "HTTPS"
}
variable "lb_listener_action_type_https" {
  description = "Action type for the load balancer listener"
  type        = string
  default     = "forward"
}
variable "domain_name" {
  description = "The domain name to use in Route 53."
  type        = string
}
variable "zone_id" {
  description = "Zone ID of your domain"
  type        = string
}
#===========================================================================
#ACM and R53
variable "validation_method" {
  description = "Validation method for acm certificate"
  type        = string
}
variable "record_type" {
  description = "Route 53 record type"
  type        = string
}
variable "evaluate_target_health" {
  description = "Evaluate target health"
  type        = bool
}
variable "r53_cert_validation_ttl" {
  description = "Route53 cert validation TTL"
  type        = number
}
#===========================================================================
#IAM
variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}
variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the IAM role"
  type        = list(string)
}
#===========================================================================
#Providers
variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}
variable "deploy_role_name" {
  description = "The name of the deploy role"
  type        = string
}
variable "account_id" {
  description = "Account ID in AWS"
  type        = number
}
#===========================================================================
#Security Groups
variable "ecs_sg_name" {
  description = "Name of the ECS Security Group"
  type        = string
}
variable "alb_sg_name" {
  description = "Name of the ECS Security Group"
  type        = string
}
variable "ecs_ingress_ports" {
  description = "List of ingress ports for the ECS security group"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr      = string
  }))
}
variable "alb_ingress_ports" {
  description = "List of ingress ports for the ALB security group"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr      = string
  }))
}
variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr      = string
  }))
}
#===========================================================================
#VPC
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}
variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}

