#Created by "YLT"

#Creating Security for ClientVPN
resource "aws_security_group" "clientvpn-security-group" {
  name        = lookup(var.name_clientvpn-sg, terraform.workspace)
  description = "Security Group for Client VPN"
  vpc_id      = "vpc-id"

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
    Name        = lookup(var.name_clientvpn-sg, terraform.workspace)
  }
}

output "clientvpn-sg-id" {
  value = aws_security_group.clientvpn-security-group.id
}