variable "name_redshift-sg" {
  type = map(any)
  default = {
    "Dev-BI"  = "Dev-Redshiftcluster-security-group"
    "Prod-BI" = "Prod-Redshiftcluster-security-group"
  }
}


variable "name_powerbi-sg" {
  type = map(any)
  default = {
    "Dev-BI"  = "Dev-PowerBI-security-group"
    "Prod-BI" = "Prod-PowerBI-security-group"
  }
}


variable "name_clientvpn-sg" {
  type = map(any)
  default = {
    "Dev-BI"  = "Dev-ClientVPN-security-group"
    "Prod-BI" = "Prod-ClientVPN-security-group"
  }
}






