variable "bucket_name" {
  description = "The name of the bucket. If empty, bucket name is loadbalancer-logs-{aws_account_id}-{region}"
  default     = ""
}

variable "region" {
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee."
  default     = ""
}
