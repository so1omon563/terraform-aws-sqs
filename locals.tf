locals {
  tags = var.tags

  name       = var.queue_name_override != null ? var.queue_name_override : var.queue_prefix == null ? format("%s", var.name) : format("%s-%s", var.name, var.queue_prefix)
  queue_name = var.fifo_queue ? format("%s.fifo", local.name) : local.name
}
