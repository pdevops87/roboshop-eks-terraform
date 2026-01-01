resource "aws_eks_cluster" "cluster" {
  name = "cluster-${var.env}"
  access_config {
    authentication_mode = "API"
  }
  role_arn = aws_iam_role.cluster-role.arn
  vpc_config {
    subnet_ids = [ subnet-0e4eadfc446b55f58, subnet-03b036986ce9c8871 ]
  }
}

resource "aws_eks_node_group" "eks-node" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "${var.env}-node"
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = [ subnet-0e4eadfc446b55f58, subnet-03b036986ce9c8871 ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}