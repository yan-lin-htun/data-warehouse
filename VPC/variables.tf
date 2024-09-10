variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public-subnet-01" {
    type = string
    default = "10.0.0.0/24"
}

variable "public-subnet-02" {
    type = string
    default = "10.0.1.0/24"
}

variable "private-subnet-01" {
    type = string
    default = "10.0.2.0/24"
}

variable "private-subnet-02" {
    type = string
    default = "10.0.3.0/24"
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "name_vpc" {
  type = string
  default = "ecommerce-app-vpc"
}

variable "name_public_subnet_01" {
  type = string
  default = "ecommerce-app-public-subnet-01"
}

variable "name_public_subnet_02" {
  type = string
  default = "ecommerce-app-public-subnet-02"
}

variable "name_private_subnet_01" {
  type = string
  default = "ecommerce-app-private-subnet-01"
}

variable "name_private_subnet_02" {
  type = string
  default = "ecommerce-app-private-subnet-02"
}

variable "name_ecommerce-app-ec2-sg" {
  type = string
  default = "ecommerce-app-ec2-sg"
}

variable "name_ecommerce-app-alb-sg" {
  type = string
  default = "ecommerce-app-alb-sg"
}

variable "name_ecommerce-app-db-sg" {
  type = string
  default = "ecommerce-app-db-sg"
}

variable "name_public_rt" {
  type = string
  default = "ecommerce-app-public-rt"
}

variable "name_private_rt" {
  type = string
  default = "ecommerce-app-private-rt"
}





