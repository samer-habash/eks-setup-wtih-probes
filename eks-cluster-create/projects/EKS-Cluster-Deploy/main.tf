module "EKS-module" {
  source = "../../modules/EKS-module"
  eks-cluster-name = "eks_develeap_demo"
  region = "us-east-1"
  worker_nodes_instance_types = "t2.micro"
  worker_nodes_disk_capacity = 8
  number_of_worker_nodes_desired = 2
  number_of_worker_nodes_min = 2
  number_of_worker_nodes_max = 3
}
