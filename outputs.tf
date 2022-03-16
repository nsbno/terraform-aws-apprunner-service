output "task_role_name" {
  description = "The name of the task role"
  value       = aws_iam_role.task_role.name
}

output "task_role_arn" {
  description = "The ARN of the task role"
  value       = aws_iam_role.task_role.arn
}
