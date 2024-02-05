#Created by "YLT"

resource "aws_s3_bucket" "s3-bucket" {
  bucket = lookup(var.name_s3-bucket, terraform.workspace)

  tags   = {
    Name = lookup(var.name_s3, terraform.workspace)
  }
}

resource "aws_s3_object" "folders" {
  count  = length(var.folder-name)
  key    = "${var.folder-name[count.index]}/"
  bucket = aws_s3_bucket.s3-bucket.id
}

resource "aws_s3_object" "files" {
  count  = length(var.file-name)
  bucket = aws_s3_bucket.s3-bucket.id
  key    = "python-scripts/${var.file-name[count.index]}"
  source = "/dev/null"
}