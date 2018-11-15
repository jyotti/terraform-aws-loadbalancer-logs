# AWS Load Balancer Logs module

Terraform module that creates S3 bucket resources for [Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html) on AWS.

## Usage

By default, create a bucket with the name `loadbalancer-logs-{your_aws_account_id}-{region}`.

For example

- aws_account_id - `123456789012`
- region - `us-east-1`

The module creates a bucket named `loadbalancer-logs-123456789012-us-east-1`

```hcl
module "loadbalancer_logs" {
  source = "github.com/jyotti/terraform-aws-loadbalancer-logs?ref=v0.1.0"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | The name of the bucket. If empty, bucket name is loadbalancer-logs-{aws_account_id}-{region} | string | `` | no |
| region | If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee. | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_arn | The ARN of the bucket |
| bucket\_id | The name of the bucket |
| bucket\_region | The AWS region this bucket resides in |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
