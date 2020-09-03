resource "aws_eks_node_group" "eks_worker_node" {
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "eks-worker-nodes"
  node_role_arn   = aws_iam_role.worker_node_iam.arn
  subnet_ids = [data.aws_subnet.subnet_id_us_east_1a.id, data.aws_subnet.subnet_id_us_east_1b.id]
  instance_types = [var.worker_nodes_instance_types]
  disk_size = var.worker_nodes_disk_capacity

  remote_access {
    ec2_ssh_key = "AWS-EC2-Key-Pair"
    source_security_group_ids = [aws_security_group.eks-sg.id]
  }

  scaling_config {
    desired_size = var.number_of_worker_nodes_desired
    min_size     = var.number_of_worker_nodes_min
    max_size     = var.number_of_worker_nodes_max
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.worker-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.worker-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
