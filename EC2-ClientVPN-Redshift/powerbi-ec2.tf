#Created by "YLT"

#Fetching the keypair data to use in powerbi instance
data "aws_key_pair" "powerbi-keypair" {
  key_name           = "keypair name"
  include_public_key = false
}


#Creating EC2 for PowerBI
resource "aws_instance" "PowerBI" {
  ami             = "ami-id"
  instance_type   = "specify the instance type" # Specify the instance type
  subnet_id       = "subnet-id"
  security_groups = [module.vpc.powerbi-sg-id]
  key_name        = data.aws_key_pair.powerbi-keypair.key_name
  root_block_device {
    volume_size = 50   # Set the size of the root volume to 50GB
    volume_type = "gp3"  # Specify the EBS volume type (e.g., gp2, gp3, io1, st1, sc1)
    delete_on_termination = true  # Optionally, specify if the volume should be deleted when the instance terminates
  }

  tags   = {
    Name = lookup(var.name_ec2, terraform.workspace)
  }
  
  lifecycle {
    prevent_destroy = true
  }
}
