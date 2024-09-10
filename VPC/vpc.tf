#Created by "YLT"

resource "aws_vpc" "ecommerce-app-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags = {
    Name        = var.name_vpc
  }
}

output "vpc-id" {
  value = aws_vpc.ecommerce-app-vpc.id
}

