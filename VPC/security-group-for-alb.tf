#Created by "YLT"
#Creating Security Group for E-Commerce-App-ALB
resource "aws_security_group" "ecommerce-app-alb-sg" {
  name        = var.name_ecommerce-app-alb-sg
  description = "Security Group for E-Commerce-App-ALB"
  vpc_id      = aws_vpc.ecommerce-app-vpc.id

  // Inbound rules (ingress)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound rules (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = var.name_ecommerce-app-alb-sg
  }
}

output "ecommerce-app-alb-sg-id" {
  value = aws_security_group.ecommerce-app-alb-sg.id
}
