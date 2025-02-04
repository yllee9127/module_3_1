terraform {
  backend "s3" {
    bucket = "yls3backend.sctp-sandbox.com"
    key    = "yl-state.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "static_bucket" {
 bucket = "yls3.sctp-sandbox.com"
 force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "enable_public_access" {
  bucket = aws_s3_bucket.static_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.static_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_bucket.id

  index_document {
    suffix = "index.html"
  }

}
