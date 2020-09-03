output "eks-develeap-endpoint" {
  value = aws_eks_cluster.aws_eks.endpoint
}

output "eks-develeap-kubeconfig" {
  value = aws_eks_cluster.aws_eks.certificate_authority[0].data
}

output "config_map_aws_auth" {
  value = local.config_map_aws_auth
}

output "kubeconfig" {
  value = local.kubeconfig
}

output "workstation-external-ip" {
  value = local.workstation-external-cidr
}