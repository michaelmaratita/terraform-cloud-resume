resource "aws_sns_topic" "mailme" {
  name = "mailme"
  display_name = "Contact Me!"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.mailme.arn
  protocol  = "email"
  endpoint  = var.my_email
}