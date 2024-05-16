variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_task_family" {
  description = "Family of the ECS task definition"
  type        = string
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

variable "secret_word" {
  description = "Secret Word Env variable"
  type        = string
}

variable "secret_word_value" {
  description = "Secret Word Value"
  type        = string
}
variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}

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

variable "lb_listener_port" {
  description = "Port for the load balancer listener"
  type        = number
}

variable "lb_listener_protocol" {
  description = "Protocol for the load balancer listener"
  type        = string
  default     = "HTTP"
}

variable "lb_listener_action_type" {
  description = "Action type for the load balancer listener"
  type        = string
  default     = "forward"
}

variable "lb_listener_port_https" {
  description = "Port for the load balancer listener"
  type        = number
}

variable "lb_listener_protocol_https" {
  description = "Protocol for the load balancer listener"
  type        = string
  default     = "HTTP"
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
