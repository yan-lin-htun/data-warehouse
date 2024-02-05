#Created by "YLT"

#Creating Security Group for PowerBI
resource "aws_security_group" "PowerBI-security-group" {
  name        = lookup(var.name_powerbi-sg, terraform.workspace)
  description = "Security Group for PowerBI"
  vpc_id      = "vpc-id"

  // Inbound rules (ingress)
  ingress {
    from_port   = 3389
    to_port     = 3389
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
    Name        = lookup(var.name_powerbi-sg, terraform.workspace)
  }
}

output "powerbi-sg-id" {
  value = aws_security_group.PowerBI-security-group.id
}
