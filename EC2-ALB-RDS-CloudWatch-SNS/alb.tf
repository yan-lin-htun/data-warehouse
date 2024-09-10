#Created by YLT

module "vpc" {
  source = "../VPC"
}

module "s3" {
  source = "../S3"
}

# Creating Application Load Balancer target group
resource "aws_lb_target_group" "ecommerce-app-alb-tg" {
  name        = "${var.name_ec2}-alb-tg"
  target_type = "instance"
  port        = 1337
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc-id
  health_check {
        path                = "/"
        protocol            = "HTTP"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 5
        interval            = 10
    }
}


#Creating Application Load Balancer for Ecommerce App
resource "aws_lb" "ecommerce-app-alb" {
  name               = "ecommerce-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.ecommerce-app-alb-sg-id]
  subnets            = [module.vpc.public-subnet-01-id, module.vpc.public-subnet-02-id]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = true

  access_logs {
    bucket  = module.s3.s3-bucket-id
    prefix  = "ecommerce-app-alb-logs"
    enabled = true
  }

  tags = {
    Name = "Application Load Balancer for Ecommerce App"
  }
  depends_on = [module.vpc.ecommerce-app-internet-gateway]
}


#Creating listener of application loadbalancer 
resource "aws_lb_listener" "ecommerce-app-alb-listener" {
  load_balancer_arn = aws_lb.ecommerce-app-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:793856936090:certificate/50e9ae3c-0652-4cca-bbde-6631bd5e869a"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecommerce-app-alb-tg.arn
  }
}