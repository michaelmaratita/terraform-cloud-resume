resource "aws_sns_topic" "topic" {
  name = var.name
  display_name = var.display_name
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}