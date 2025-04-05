#resource "aws_s3_bucket" "my_bucket" {
#  bucket = "my-test-bucket"
#}

#output "bucket_name" {
#  value = aws_s3_bucket.my_bucket.bucket
#}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}
