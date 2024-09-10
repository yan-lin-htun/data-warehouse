#Created by "YLT"

#Creating Subnets
resource "aws_subnet" "ecommerce-app-public-sub-01" {
  vpc_id     = aws_vpc.ecommerce-app-vpc.id
  cidr_block = var.public-subnet-01
  availability_zone = "ap-southeast-1a"
  tags = {
    Name        = var.name_public_subnet_01
  }
}

resource "aws_subnet" "ecommerce-app-public-sub-02" {
  vpc_id     = aws_vpc.ecommerce-app-vpc.id
  cidr_block = var.public-subnet-02
  availability_zone = "ap-southeast-1b"
  tags = {
    Name        = var.name_public_subnet_02
  }
}

resource "aws_subnet" "ecommerce-app-private-sub-01" {
  vpc_id     = aws_vpc.ecommerce-app-vpc.id
  cidr_block = var.private-subnet-01
  availability_zone = "ap-southeast-1a"
  tags = {
    Name        = var.name_private_subnet_01
  }
}

resource "aws_subnet" "ecommerce-app-private-sub-02" {
  vpc_id     = aws_vpc.ecommerce-app-vpc.id
  cidr_block = var.private-subnet-02
  availability_zone = "ap-southeast-1b"
  tags = {
    Name        = var.name_private_subnet_02
  }
}

output "public-subnet-01-id" {
    value = aws_subnet.ecommerce-app-public-sub-01.id
}

output "public-subnet-02-id" {
    value = aws_subnet.ecommerce-app-public-sub-02.id
}

output "private-subnet-01-id" {
    value = aws_subnet.ecommerce-app-private-sub-01.id
}

output "private-subnet-02-id" {
    value = aws_subnet.ecommerce-app-private-sub-02.id
}
