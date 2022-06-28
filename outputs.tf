output "queue" {
  value       = { for key, value in aws_sqs_queue.queue : key => value }
  description = "A map of properties for the created SQS queue."
}
