output "cluster_id" {
  value       = aws_ecs_cluster.this.id
  description = "The ID of the ECS cluster"
}

output "cluster_arn" {
  value       = aws_ecs_cluster.this.arn
  description = "The ARN of the ECS cluster"
}

output "task_execution_role_arn" {
  value       = aws_iam_role.task_execution_role.arn
  description = "The ARN of the task execution role"
}

output "task_role_arn" {
  value       = aws_iam_role.task_role.arn
  description = "The ARN of the task role"
}

output "service_name" {
  value = aws_ecs_service.nginx.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.nginx.arn
}

