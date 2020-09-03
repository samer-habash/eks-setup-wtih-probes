output "config_map_aws_auth" {
  value = module.EKS-module.config_map_aws_auth
}

output "kubeconfig" {
  value = module.EKS-module.kubeconfig
}

output "workstation-ip" {
  value = module.EKS-module.workstation-external-ip
}