#cloudwatch.tf

variable "ec2_instance_ids" {
  type = map(string)
  default = {
    instance1 = "i-0a364a5c669ff248a"
    instance2 = "i-0162e61c8f3623983"
    instance3 = "i-034cfd07bf630f802"
    instance4 = "i-003c4ab66d962cb07"
    # Add more instances here if needed
  }
}

resource "aws_sns_topic" "ec2-cpuusage-cloudwatch-alarms-topic-sns" {
  name = "ec2-cpuusage-cloudwatch-alarms-topic-sns"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.ec2-cpuusage-cloudwatch-alarms-topic-sns.arn
  protocol  = "email"
  endpoint  = "emiliodallas55@gmail.com"  # Replace with your email address
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpuusage-cloudwatch-alarms-topic-sns" {
  for_each = var.ec2_instance_ids

  alarm_name                = "high-cpu-utilization-alarm-${each.key}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "This metric monitors EC2 cpu utilization"
  alarm_actions             = [aws_sns_topic.ec2-cpuusage-cloudwatch-alarms-topic-sns.arn]

  dimensions = {
        InstanceId = each.value
  }
}