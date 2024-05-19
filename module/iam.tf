resource "aws_iam_role" "ecs_task_execution_role" {
  name                = var.role_name
  managed_policy_arns = var.managed_policy_arns

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}
