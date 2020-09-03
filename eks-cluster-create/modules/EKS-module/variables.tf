variable "eks-cluster-name" {
  default = "eks_develeap_demo"
  type    = string
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "number_of_worker_nodes_desired" {
  default = 1
  type    = number
}

variable "number_of_worker_nodes_min" {
  default = 1
  type    = number
}

variable "number_of_worker_nodes_max" {
  default = 1
  type    = number
}

variable "worker_nodes_instance_types" {
  default = "t2.micro"
  type =string
}

variable "worker_nodes_disk_capacity" {
  default = 20
  type = number
}