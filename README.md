# CloudWatch Agent Configuration

This project uses the Amazon CloudWatch Agent to collect logs and custom application metrics from the container or EC2 instance.

## Configuration Overview
The agent is configured to:
- Collect application logs from /var/log/app/app.log
- Send logs to CloudWatch Logs under the group /app/logs
- Publish custom metrics using the statsd and collectd protocols

To define custom CloudWatch metrics like:
- Application latency
- Error rate

We can use the CloudWatch Agent to publish metrics from our application logs or by pushing metrics directly.

Attached the CloudWatch Agent configuration file (amazon-cloudwatch-agent.json) to collect and publish application metrics from logs, such as latency and error rate, assuming app logs in a structured way (e.g., JSON logs)

> Make sure the IAM role or instance profile has the required CloudWatch permissions.