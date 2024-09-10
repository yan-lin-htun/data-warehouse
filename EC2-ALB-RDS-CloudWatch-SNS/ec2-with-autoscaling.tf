#Created by "YLT"

# Generating an RSA private key
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "TF_key" {
    key_name = "TF_key"
    public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "private_key" {
    content = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
}

# Creating launch template to launch ec2 instance
resource "aws_launch_template" "ecommerce-app-lt" {
  name = "ecommerce-app-lt"
  image_id = "ami-0497a974f8d5dcef8"
  instance_type = "t3a.medium"
  key_name = "TF_key"
  vpc_security_group_ids = [module.vpc.ecommerce-app-ec2-sg-id]
  user_data = filebase64("EC2-ALB-RDS-CloudWatch-SNS/user_data.sh")

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_type = "gp3"
      volume_size = 20
      delete_on_termination = true
    }
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "E-Commerce App launch template"
    }
  }
}


# Creating Auto Scaling group
resource "aws_autoscaling_group" "ecommerce-app-asg" {
  name                 = "${var.name_ec2}-asg"
  desired_capacity     = 2
  max_size             = 5
  min_size             = 2
  health_check_type    = "EC2"
  vpc_zone_identifier  = [module.vpc.private-subnet-01-id, module.vpc.private-subnet-02-id]

  launch_template {
    id      = aws_launch_template.ecommerce-app-lt.id
    version = "$Latest"
  }

    tag {
    key                 = "Name"
    value               = "ecommerce-app"
    propagate_at_launch = true
  }
}


#Creating EC2 Autoscaling Policy 
resource "aws_autoscaling_policy" "increase_ec2" {
    name                   = "increase-ec2"
    scaling_adjustment     = 1
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.ecommerce-app-asg.name
    policy_type = "SimpleScaling"  
}

resource "aws_autoscaling_policy" "reduce_ec2" {
    name                   = "reduce-ec2"
    scaling_adjustment     = -1
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.ecommerce-app-asg.name
    policy_type = "SimpleScaling"
}


# Creating autoscaling attachment
resource "aws_autoscaling_attachment" "ecommerce-app-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.ecommerce-app-asg.id
  lb_target_group_arn    = aws_lb_target_group.ecommerce-app-alb-tg.arn
}


