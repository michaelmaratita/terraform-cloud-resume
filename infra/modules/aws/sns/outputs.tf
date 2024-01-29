# SNS Topic
output "topic_id" {
  description = "The ARN of the SNS topic"
  value = aws_sns_topic.topic.id
}

output "topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value = aws_sns_topic.topic.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_sns_topic.topic.tags_all
}

output "beginning_archive_time" {
  description = "The oldest timestamp at which a FIFO topic subscriber can start a replay."
  value = aws_sns_topic.topic.beginning_archive_time
}

# SNS subsc
output "sub_arn" {
  description = "ARN of the subscription."
  value = aws_sns_topic_subscription.subscription.arn
}

output "confirmation_was_authenticated" {
  description = "Whether the subscription confirmation request was authenticated."
  value = aws_sns_topic_subscription.subscription.confirmation_was_authenticated
}

output "sub_id" {
  description = "ARN of the subscription."
  value = aws_sns_topic_subscription.subscription.id
}

