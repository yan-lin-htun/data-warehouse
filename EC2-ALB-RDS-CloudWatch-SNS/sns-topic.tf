#Created by YLT

#Creating SNS topic for email noti
resource "aws_sns_topic" "ecommerce_app_sns_topic" {
  name = "ecommerce_app_cpu_alarm_topic"
}

resource "aws_sns_topic_subscription" "ecommerce_app_sns_topic_subscription" {
  topic_arn = aws_sns_topic.ecommerce_app_sns_topic.arn
  protocol  = "email"
  endpoint  = "yanlinhtun285003@gmail.com"
}