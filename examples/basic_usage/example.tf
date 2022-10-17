provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "sqs_queue" {
  source  = "so1omon563/sqs/aws"
  version = "1.1.0" # Replace with appropriate version
  name    = "example-queue"
  tags = {
    example = "true"
  }
  queue_prefix = "my-product-name"
}
