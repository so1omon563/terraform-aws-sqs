# Basic usage

Basic usage example.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
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
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sqs_queue"></a> [sqs\_queue](#module\_sqs\_queue) | so1omon563/sqs/aws | 1.1.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
