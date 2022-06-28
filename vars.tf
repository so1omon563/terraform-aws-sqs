variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix. See [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements."
}

variable "queue_prefix" {
  description = "Queue name prefix, will be appended to `var.name` if a value is supplied. See [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements."
  type        = string
  default     = null
}

variable "queue_name_override" {
  description = "Used if there is a need to specify a queue name outside of the standardized nomenclature. For example, if importing a queue that doesn't follow the standard naming formats. See [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements."
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "visibility_timeout_seconds" {
  type        = number
  description = "The visibility timeout for the queue. An integer from **0** to **43200** (12 hours). The default for this attribute is **30**. For more information about visibility timeout, see [AWS docs](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)."
  validation {
    condition     = can(regex("\\d|[1-9]\\d{1,3}|[1-3]\\d{4}|4[0-2]\\d{3}|43[01]\\d{2}|43200", var.visibility_timeout_seconds))
    error_message = "Must be an integer between 0 and 43200."
  }
  default = 30
}

variable "message_retention_seconds" {
  type        = number
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from **60** (1 minute) to **1209600** (14 days). The default for this attribute is **345600** (4 days)."
  validation {
    condition     = can(regex("6\\d|[7-9]\\d|[1-9]\\d{2,5}|1[01]\\d{5}|120[0-8]\\d{3}|1209[0-5]\\d{2}|1209600", var.message_retention_seconds))
    error_message = "Must be an integer between 60 and 1209600."
  }
  default = 345600
}

variable "max_message_size" {
  type        = number
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from **1024** bytes (1 KiB) up to **262144** bytes (256 KiB). The default for this attribute is **262144** (256 KiB)."
  validation {
    condition     = can(regex("102[4-9]|10[3-9]\\d|1[1-9]\\d{2}|[2-9]\\d{3}|[1-9]\\d{4}|1\\d{5}|2[0-5]\\d{4}|26[01]\\d{3}|2620\\d{2}|2621[0-3]\\d|26214[0-4]", var.max_message_size))
    error_message = "Must be an integer between 1024 and 262144."
  }
  default = 262144
}

variable "delay_seconds" {
  type        = number
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from **0** to **900** (15 minutes). The default for this attribute is **0** seconds."
  validation {
    condition     = can(regex("\\d|[1-9]\\d|[1-8]\\d{2}|900", var.delay_seconds))
    error_message = "Must be an integer between 0 and 900."
  }
  default = 0
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from **0** to **20** (seconds). The default for this attribute is **0**, meaning that the call will return immediately."
  validation {
    condition     = can(regex("\\d|1\\d|20", var.receive_wait_time_seconds))
    error_message = "Must be an integer between 0 and 20."
  }
  default = 0
}

variable "policy" {
  type        = string
  description = "The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/tutorials/terraform/aws-iam-policy?_ga=2.82257951.884055799.1634563672-272413849.1610471322)."
  default     = null
}

variable "redrive_policy" {
  type        = string
  description = "The JSON policy to set up the Dead Letter Queue, see [AWS docs](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html). Note: when specifying **maxReceiveCount**, you must specify it as an integer (**5**), and not a string (**'5'**)."
  default     = null
}

variable "fifo_queue" {
  type        = bool
  description = "Boolean designating a FIFO queue. If not set, it defaults to **false** making it standard. Note that if enabling a FIFO queue, this module will automatically append the queue name with **.fifo**, per the naming requirements for FIFO queues."
  default     = false
}

variable "content_based_deduplication" {
  type        = bool
  description = "Enables content-based deduplication for FIFO queues. For more information, see the [related documentation](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)."
  default     = false
}

variable "kms_master_key_id" {
  type        = string
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see [Key Terms](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms)."
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between **60** seconds (1 minute) and **86,400** seconds (24 hours). The default is **300** (5 minutes)."
  validation {
    condition     = can(regex("6\\d|[7-9]\\d|[1-9]\\d{2,3}|[1-7]\\d{4}|8[0-5]\\d{3}|86[0-3]\\d{2}|86400", var.kms_data_key_reuse_period_seconds))
    error_message = "Must be an integer between 60 and 86400."
  }
  default = 300
}

variable "deduplication_scope" {
  type        = string
  description = "Specifies whether message deduplication occurs at the message group or queue level. Valid values are **messageGroup** and **queue** (default)."
  validation {
    condition     = contains(["messageGroup", "queue"], var.deduplication_scope)
    error_message = "Valid values are limited to (messageGroup, queue)."
  }
  default = "queue"
}

variable "fifo_throughput_limit" {
  type        = string
  description = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are **perQueue** (default) and **perMessageGroupId**."
  validation {
    condition     = contains(["perQueue", "perMessageGroupId"], var.fifo_throughput_limit)
    error_message = "Valid values are limited to (perQueue, perMessageGroupId)."
  }
  default = "perQueue"
}
