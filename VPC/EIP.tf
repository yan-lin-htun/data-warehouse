#Created by YLT

#Creating EIP for NAT Gateway
resource "aws_eip" "ecommerce-app-eip" {
  domain   = "vpc"
  depends_on = [aws_internet_gateway.ecommerce-app-internet-gw]
}