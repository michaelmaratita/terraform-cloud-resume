output "arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value = aws_iam_role.role.arn
}

output "create_date" {
  description = "Creation date of the IAM role."
  value = aws_iam_role.role.create_date
}

output "id" {
  description = "Name of the role."
  value = aws_iam_role.role.id
}

output "name" {
  description = "Name of the role."
  value = aws_iam_role.role.name
}

output "tags_all" {
  description = " A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_iam_role.role.tags_all
}

output "unique_id" {
  description = "Stable and unique string identifying the role."
  value = aws_iam_role.role.unique_id
}