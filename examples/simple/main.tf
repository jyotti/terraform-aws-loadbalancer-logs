provider "aws" {
  region = "us-east-1"
}

# loadbalancer-logs-105776485808-ap-northeast-1
module "loadbalancer_logs_bucket" {
  source = "../../"
}
