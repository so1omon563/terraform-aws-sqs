variable "name" {}

variable "tags" {}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}

module "sqs" {
  source = "../../../"

  name = var.name
}
output "sqs" { value = module.sqs }
