#Created by YLT

#Creating Internet Gateway
resource "aws_internet_gateway" "ecommerce-app-internet-gw" {
  vpc_id = aws_vpc.ecommerce-app-vpc.id

  tags = {
    Name = "Internet Gateway for E-Commerce App"
  }
}

output "ecommerce-app-internet-gateway" {
  value = aws_internet_gateway.ecommerce-app-internet-gw.id
}