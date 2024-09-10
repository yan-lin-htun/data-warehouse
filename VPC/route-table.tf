#Created by YLT

#Creating Private Route table
resource "aws_route_table" "ecommerce-app-public-rt" {
  vpc_id = aws_vpc.ecommerce-app-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecommerce-app-internet-gw.id
  }
  tags = {
    Name   = var.name_public_rt
  }
  depends_on = [aws_internet_gateway.ecommerce-app-internet-gw]
}

resource "aws_route_table" "ecommerce-app-private-rt" {
  vpc_id = aws_vpc.ecommerce-app-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ecommerce-app-nat-gw.id
  }
  tags = {
    Name   = var.name_private_rt
  }
  depends_on = [aws_nat_gateway.ecommerce-app-nat-gw]
}

#Association public route table with public subnets
resource "aws_route_table_association" "ecommerce-app-public-sub-01-association" {
  subnet_id      = aws_subnet.ecommerce-app-public-sub-01.id
  route_table_id = aws_route_table.ecommerce-app-public-rt.id
}

resource "aws_route_table_association" "ecommerce-app-public-sub-02-association" {
  subnet_id      = aws_subnet.ecommerce-app-public-sub-02.id
  route_table_id = aws_route_table.ecommerce-app-public-rt.id
}

#Association private route table with private subnets
resource "aws_route_table_association" "ecommerce-app-private-sub-01-association" {
  subnet_id      = aws_subnet.ecommerce-app-private-sub-01.id
  route_table_id = aws_route_table.ecommerce-app-private-rt.id
}

resource "aws_route_table_association" "ecommerce-app-private-sub-02-association" {
  subnet_id      = aws_subnet.ecommerce-app-private-sub-02.id
  route_table_id = aws_route_table.ecommerce-app-private-rt.id
}