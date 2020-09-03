resource "aws_security_group" "eks-sg" {
  name        = "terraform-eks-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-eks"
  }
}


resource "aws_security_group_rule" "eks-ingress-workstation-sam" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks-sg.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "eks-ingress-workstation-sam-via-ssh" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with cluster nodes via ssh"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.eks-sg.id
  to_port           = "22"
  type              = "ingress"
}