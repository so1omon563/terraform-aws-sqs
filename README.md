# SQS Queue

Creates an SQS Queue. Supports all standard options for the SQS Queue resource.

Examples for use can be found under the [examples](https://github.com/so1omon563/terraform-aws-sqs/tree/main/examples) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues. For more information, see the [related documentation](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing). | `bool` | `false` | no |
| <a name="input_deduplication_scope"></a> [deduplication\_scope](#input\_deduplication\_scope) | Specifies whether message deduplication occurs at the message group or queue level. Valid values are **messageGroup** and **queue** (default). | `string` | `"queue"` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from **0** to **900** (15 minutes). The default for this attribute is **0** seconds. | `number` | `0` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue. If not set, it defaults to **false** making it standard. Note that if enabling a FIFO queue, this module will automatically append the queue name with **.fifo**, per the naming requirements for FIFO queues. | `bool` | `false` | no |
| <a name="input_fifo_throughput_limit"></a> [fifo\_throughput\_limit](#input\_fifo\_throughput\_limit) | Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are **perQueue** (default) and **perMessageGroupId**. | `string` | `"perQueue"` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between **60** seconds (1 minute) and **86,400** seconds (24 hours). The default is **300** (5 minutes). | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see [Key Terms](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms). | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from **1024** bytes (1 KiB) up to **262144** bytes (256 KiB). The default for this attribute is **262144** (256 KiB). | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from **60** (1 minute) to **1209600** (14 days). The default for this attribute is **345600** (4 days). | `number` | `345600` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. See [aws\_sqs\_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform, see the [AWS IAM Policy Document Guide](https://learn.hashicorp.com/tutorials/terraform/aws-iam-policy?_ga=2.82257951.884055799.1634563672-272413849.1610471322). | `string` | `null` | no |
| <a name="input_queue_name_override"></a> [queue\_name\_override](#input\_queue\_name\_override) | Used if there is a need to specify a queue name outside of the standardized nomenclature. For example, if importing a queue that doesn't follow the standard naming formats. See [aws\_sqs\_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements. | `string` | `null` | no |
| <a name="input_queue_prefix"></a> [queue\_prefix](#input\_queue\_prefix) | Queue name prefix, will be appended to `var.name` if a value is supplied. See [aws\_sqs\_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#name) for more information on name restrictions / requirements. | `string` | `null` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from **0** to **20** (seconds). The default for this attribute is **0**, meaning that the call will return immediately. | `number` | `0` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | The JSON policy to set up the Dead Letter Queue, see [AWS docs](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html). Note: when specifying **maxReceiveCount**, you must specify it as an integer (**5**), and not a string (**'5'**). | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from **0** to **43200** (12 hours). The default for this attribute is **30**. For more information about visibility timeout, see [AWS docs](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html). | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue"></a> [queue](#output\_queue) | A map of properties for the created SQS queue. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
