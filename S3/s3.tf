#Created by "YLT"

resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.name_s3-bucket

  tags   = {
    Name = var.name_s3-bucket
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3-bucket.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::114774131450:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::ecommerce-app-alb-bucket/*"
        }
    ]
}
EOF
}


output "s3-bucket-id" {
   value = aws_s3_bucket.s3-bucket.id
}