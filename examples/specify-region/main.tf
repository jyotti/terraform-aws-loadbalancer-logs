provider "aws" {
  region = "us-east-1"
}

module "loadbalancer_logs_bucket" {
  source = "../../"
  region = "ap-northeast-1"
}
