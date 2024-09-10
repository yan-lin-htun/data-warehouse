#Created by "YLT"

#Creating DB for Glue Crawlers
resource "aws_glue_catalog_database" "crawler-db" {
  for_each = var.prod-crawler-configurations
  name     = each.value.db_name
}

#Creating AWS Glue Crawlers
resource "aws_glue_crawler" "glue-crawlers" {
  for_each      = var.prod-crawler-configurations
  database_name = aws_glue_catalog_database.crawler-db[each.key].name
  name          = each.value.crawler_name
  role          = aws_iam_role.iam-role-for-glue.arn

  s3_target {
    path = each.value.s3_path
  }
}

#Creating Python Glue Jobs
resource "aws_glue_job" "glue_jobs" {
  for_each = var.prod-glue_jobs
  name     = each.value.name
  role_arn = aws_iam_role.iam-role-for-glue.arn

  command {
    name            = each.value.name
    script_location = each.value.script_location
  }
}



