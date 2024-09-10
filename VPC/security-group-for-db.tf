#Created by "YLT"

#Creating Security Group for E-Commerce-App-DB
resource "aws_security_group" "ecommerce-app-db-sg" {
  name        = var.name_ecommerce-app-db-sg
  description = "Security Group for E-Commerce-App-DB"
  vpc_id      = aws_vpc.ecommerce-app-vpc.id
  tags = {
    Name        = var.name_ecommerce-app-db-sg
  }
  // Outbound rules (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow-ecommerce-app-ec2" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecommerce-app-ec2-sg.id
  security_group_id        = aws_security_group.ecommerce-app-db-sg.id
}


output "ecommerce-app-db-sg-id" {
  value = aws_security_group.ecommerce-app-db-sg.id
}