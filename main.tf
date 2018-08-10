terraform {
  required_version = ">= 0.11"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_elb_service_account" "this" {}

locals {
  region = "${length(var.region) == 0 ? data.aws_region.current.name : var.region}"
  // loadbalancer-logs-123456789012-us-east-1
  bucket_name = "${length(var.bucket_name) == 0 ? format("loadbalancer-logs-%s-%s", data.aws_caller_identity.current.account_id, local.region) : var.bucket_name}"
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_elb_service_account.this.id}:root",
      ]
    }
  }
}

resource "aws_s3_bucket" "this" {
  bucket        = "${local.bucket_name}"
  policy        = "${data.aws_iam_policy_document.this.json}"
}
