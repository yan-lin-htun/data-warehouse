variable "name_ec2" {
  type = string
  default = "ecommerce-app"
}

variable "username" {
  type = string
  default = "postgres"
}

variable "password" {
  type = string
  default = "NyCmixHeGzWV2gkp"
}

variable "name_db_subnet_group" {
  type = string
  default = "ecommerce-app-db-subnet-gp"
}

variable "rds_name" {
  type = string
  default = "ecommerce-app-db"
}