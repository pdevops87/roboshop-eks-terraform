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

# access entry , who installed eks cluster(workstation resource) need to authenticate to eks cluster
# kubectl is used to interact with the EKS cluster, while AWS IAM is used to authenticate and authorize access.
# to create access entry
resource "aws_eks_access_entry" "access_entry" {
  cluster_name      = aws_eks_cluster.cluster.name
  principal_arn     = "arn:aws:iam::041445559784:role/workstattion_role"
  type              = "STANDARD"
}

 # policies to allow for this role
resource "aws_eks_access_policy_association" "policy_association" {
  cluster_name  = aws_eks_cluster.cluster.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::041445559784:role/workstattion_role"
  access_scope {
    type       = "cluster"
  }
}

resource "null_resource" "kube-config"{
  triggers = {
    always_run = timestamp()
    cluster_id = aws_eks_cluster.cluster.id
  }
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name dev-cluster"
  }
}