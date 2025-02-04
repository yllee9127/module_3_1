provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "yls3.sctp-sandbox.com"
    key    = "terraform/yl-state.tfstate"
    region = "ap-southeast-1"
  }
}

