variable "name_s3-bucket" {
  type = map(any)
  default = {
    "Dev-BI"  = "dev-glue-report-portal"
    "Prod-BI" = "prod-glue-report-portal"
  }
}

variable "name_s3" {
  type = map(any)
  default = {
    "Dev-BI"  = "Dev Report bucket"
    "Prod-BI" = "Prod Report bucket"
  }
}

variable "folder-name" {
  type    = list(any)
  default = ["transaction", "reseller", "product"]
}

variable "file-name" {
  type    = list(any)
  default = ["transaction-glue.py", "reseller-glue.py", "product-glue.py"]
}

