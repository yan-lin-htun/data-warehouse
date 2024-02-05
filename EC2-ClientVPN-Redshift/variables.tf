variable "redshift_password" {
  description = "Password for the Redshift cluster"
  type        = string
  default     = "password of redshift"
  sensitive   = true
}

variable "name_redshift-sub-gp" {
  type = map(any)
  default = {
    "Dev-BI"  = "dev-redshiftcluster-subnet-group"
    "Prod-BI" = "prod-redshiftcluster-subnet-group"
  }
}

variable "name_redshift-cluster" {
  type = map(any)
  default = {
    "Dev-BI"  = "dev-report-redshift-cluster"
    "Prod-BI" = "prod-report-redshift-cluster"
  }
}

variable "name_ec2" {
  type = map(any)
  default = {
    "Dev-BI"  = "Dev-PowerBI"
    "Prod-BI" = "Prod-PowerBI"
  }
}

variable "name_clientvpn" {
  type = map(any)
  default = {
    "Dev-BI"  = "Client VPN for Dev BI"
    "Prod-BI" = "Client VPN for Prod BI"
  }
}

