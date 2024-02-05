variable "dev-crawler-configurations" {
  type = map(object({
    db_name      = string
    crawler_name = string
    s3_path      = string
  }))
  default = {
    "crawler1" = {
      db_name      = "dev-transaction-db"
      crawler_name = "dev-transaction-crawler"
      s3_path      = "s3://dev-glue-report-portal/transaction"
    },
    "crawler2" = {
      db_name      = "dev-reseller-db"
      crawler_name = "dev-reseller-crawler"
      s3_path      = "s3://dev-glue-report-portal/reseller"
    },
    "crawler3" = {
      db_name      = "dev-product-db"
      crawler_name = "dev-product-crawler"
      s3_path      = "s3://dev-glue-report-portal/product"
    }
  }
}


variable "dev-glue_jobs" {
  type = map(object({
    name            = string
    script_location = string
  }))
  default = {
    "job1" = {
      name            = "dev-transaction-glue-job"
      script_location = "s3://dev-glue-report-portal/python-scripts/transaction-glue.py"
    },
    "job2" = {
      name            = "dev-reseller-glue-job"
      script_location = "s3://dev-glue-report-portal/python-scripts/reseller-glue.py"
    },
    "job3" = {
      name            = "dev-product-glue-job"
      script_location = "s3://dev-glue-report-portal/python-scripts/product-glue.py"
    }
  }
}


variable "prod-crawler-configurations" {
  type = map(object({
    db_name      = string
    crawler_name = string
    s3_path      = string
  }))
  default = {
    "crawler1" = {
      db_name      = "prod-transaction-db"
      crawler_name = "prod-transaction-crawler"
      s3_path      = "s3://prod-glue-report-portal/transaction"
    },
    "crawler2" = {
      db_name      = "prod-reseller-db"
      crawler_name = "prod-reseller-crawler"
      s3_path      = "s3://prod-glue-report-portal/reseller"
    },
    "crawler3" = {
      db_name      = "prod-product-db"
      crawler_name = "prod-product-crawler"
      s3_path      = "s3://prod-glue-report-portal/product"
    }
  }
}


variable "prod-glue_jobs" {
  type = map(object({
    name            = string
    script_location = string
  }))
  default = {
    "job1" = {
      name            = "prod-transaction-glue-job"
      script_location = "s3://prod-glue-report-portal/python-scripts/transaction-glue.py"
    },
    "job2" = {
      name            = "prod-reseller-glue-job"
      script_location = "s3://prod-glue-report-portal/python-scripts/reseller-glue.py"
    },
    "job3" = {
      name            = "prod-product-glue-job"
      script_location = "s3://prod-glue-report-portal/python-scripts/product-glue.py"
    }
  }
}





