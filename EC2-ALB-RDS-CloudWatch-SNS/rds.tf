#Created by YLT

#Creating DB Subnet Group
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = var.name_db_subnet_group
  subnet_ids = [module.vpc.private-subnet-01-id, module.vpc.private-subnet-02-id]

  tags = {
    Name = var.name_db_subnet_group
  }

  lifecycle {
    prevent_destroy = true
  }
}

#Creating RDS Postgresql for E-Commerce App
resource "aws_db_instance" "ecommerce-app-db" {
  allocated_storage    = 10
  db_name              = "postgres"
  identifier           = var.rds_name
  engine               = "postgres"
  engine_version       = "12.17"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.postgres12"
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [module.vpc.ecommerce-app-db-sg-id]
  skip_final_snapshot  = true

  tags = {
    Name = var.rds_name
  }

  lifecycle {
    prevent_destroy = true
  }
}
