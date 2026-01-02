resource "aws_eks_cluster" "cluster" {
  name = "${var.env}-cluster"
  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }
  role_arn = aws_iam_role.cluster-role.arn
  vpc_config {
    subnet_ids = [ "subnet-0e4eadfc446b55f58", "subnet-03b036986ce9c8871" ]
  }
}

resource "aws_eks_node_group" "eks-node" {
  cluster_name    = aws_eks_cluster.cluster.name
#   ami_type = ""
  node_group_name = "${var.env}-node"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = [ "subnet-0e4eadfc446b55f58", "subnet-03b036986ce9c8871" ]
  capacity_type = "SPOT"
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}


# AmazonEC2ContainerRegistryReadOnly
# AmazonEKS_CNI_Policy
# AmazonEKSWorkerNodePolicy