provider "aws" {
    region = "us-east-1"
}

resource "aws_kms_key" "mykey" {
   description             = "This key is used to encrypt bucket objects"
   deletion_window_in_days = 10
   tags = {
    Name        = "My KMS Key"
    Environment = "Sandbox"
    Owner       = "VENKAT"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "raman-tf"

  tags = {
    Name        = "My S3 test bucket 22 May 2020"
    Environment = "POC"
    Owner       = "VENKAT",
    DataType    = "Test files"
  }
}

resource "aws_s3_bucket_acl" "b" {
  bucket = aws_s3_bucket.b.id
  acl = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "b" {
  bucket = aws_s3_bucket.b.id
  target_bucket = "venkat-tf-01-Mar-2022"
  target_prefix = "s3logs/us-east-1/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "b" {
  bucket = aws_s3_bucket.b.id
  rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
}
