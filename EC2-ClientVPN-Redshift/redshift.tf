#Created by "YLT"

#Creating Subnet Group of Redshift Cluster
resource "aws_redshift_subnet_group" "redshiftcluster_subnet_group" {
  name        = lookup(var.name_redshift-sub-gp, terraform.workspace)
  description = "Subnet Group for Redshift Cluster"
  subnet_ids  = ["subnet-id"]
}

#Creating Redshift Cluster
resource "aws_redshift_cluster" "report-redshift-cluster" {
  cluster_identifier        = lookup(var.name_redshift-cluster, terraform.workspace)
  database_name             = "report_redshift_db"
  master_username           = "report_user"
  master_password           = var.redshift_password
  node_type                 = "dc2.large"
  cluster_type              = "single-node"
  publicly_accessible       = false
  automated_snapshot_retention_period = "0"
  vpc_security_group_ids    = [module.vpc.redshiftcluster-sg-id]
  cluster_subnet_group_name = aws_redshift_subnet_group.redshiftcluster_subnet_group.name
  #skip_final_snapshot       = true
}

#Association Redshift Cluster with IAM role
resource "aws_redshift_cluster_iam_roles" "iam-role-for-redshift" {
  cluster_identifier = aws_redshift_cluster.report-redshift-cluster.cluster_identifier
  iam_role_arns      = [aws_iam_role.iam-role-for-redshift.arn]
}