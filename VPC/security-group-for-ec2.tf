#Created by "YLT"

#Creating Security for E-Commerce-App-EC2
resource "aws_security_group" "ecommerce-app-ec2-sg" {
  name        = var.name_ecommerce-app-ec2-sg
  description = "Security Group for E-Commerce-App-EC2"
  vpc_id      = aws_vpc.ecommerce-app-vpc.id
  
  tags = {
    Name        = var.name_ecommerce-app-ec2-sg
  }

  // Outbound rules (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow-ecommerce-app-elb" {
  type                     = "ingress"
  from_port                = 1337
  to_port                  = 1337
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecommerce-app-alb-sg.id
  security_group_id        = aws_security_group.ecommerce-app-ec2-sg.id
}

output "ecommerce-app-ec2-sg-id" {
  value = aws_security_group.ecommerce-app-ec2-sg.id
}