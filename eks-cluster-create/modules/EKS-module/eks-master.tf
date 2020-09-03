resource "aws_eks_cluster" "aws_eks" {
  name     = var.eks-cluster-name
  role_arn = aws_iam_role.eks_cluster_iam.arn
  #Enable Cloudwatch Logs
  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    security_group_ids = [aws_security_group.eks-sg.id]
    subnet_ids = [data.aws_subnet.subnet_id_us_east_1a.id, data.aws_subnet.subnet_id_us_east_1b.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AWSEKSClusterPolicy,
    aws_cloudwatch_log_group.eks_master_logs
  ]

  tags = {
    Name = "EKS_develeap"
  }
}