resource "aws_cloudwatch_log_group" "eks_master_logs" {
  name              = "/aws/eks/${var.eks-cluster-name}/cluster"
  retention_in_days = 7
}