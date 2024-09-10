#Created by YLT

#Creating NAT Gateway
resource "aws_nat_gateway" "ecommerce-app-nat-gw" {
  allocation_id = aws_eip.ecommerce-app-eip.id
  subnet_id     = aws_subnet.ecommerce-app-public-sub-01.id

  tags = {
    Name = "NAT Gateway for E-Commerce App"
  }

  depends_on = [aws_internet_gateway.ecommerce-app-internet-gw]
}