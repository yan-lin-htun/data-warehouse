#Created by "YLT"

# Creating the IAM role fro Glue
resource "aws_iam_role" "iam-role-for-redshift" {
  name = "iam-role-for-redshift"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "redshift.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "redshift_attachment-1" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftAllCommandsFullAccess"
  role       = aws_iam_role.iam-role-for-redshift.name
}


