#Created by "YLT"

#Creating Security Group for Redshift
resource "aws_security_group" "Redshiftcluster-security-group" {
  name        = lookup(var.name_redshift-sg, terraform.workspace)
  description = "Security Group for Redshift Cluster"
  vpc_id      = "vpc-id"
  tags = {
    Name        = lookup(var.name_redshift-sg, terraform.workspace)
  }
}

resource "aws_security_group_rule" "allow-powerbi-ingress" {
  type                     = "ingress"
  from_port                = 5439
  to_port                  = 5439
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.PowerBI-security-group.id
  security_group_id        = aws_security_group.Redshiftcluster-security-group.id
}


output "redshiftcluster-sg-id" {
  value = aws_security_group.Redshiftcluster-security-group.id
}