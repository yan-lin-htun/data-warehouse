#Created by "YLT"

module "s3" {
    source = "./S3"
}

module "aws-glue" {
  source = "./AWS-Glue"
}

module "ecs-clientvpn-redshift" {
  source = "./EC2-ClientVPN-Redshift"
}


