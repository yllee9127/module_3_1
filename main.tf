terraform {
  backend "s3" {
    bucket = "sctp-ce8-tfstate"
    key    = "yl-state.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "static_bucket" {
 bucket = "yls3.sctp-sandbox.com"
 force_destroy = true
}
