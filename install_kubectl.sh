cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.35/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.35/rpm/repodata/repomd.xml.key
EOF



[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.35/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.35/rpm/repodata/repomd.xml.key




Access entry details
IAM principal ARN
arn:aws:iam::041445559784:role/workstattion_role
Username
-
Type
Standard

principal_arn: arn:aws:iam::041445559784:role/workstattion_role
Type: standard

Add Policies: AmazonEKSClusterAdminPolicy

Common types of IAM policies

Identity-based policies → attached to roles/users/groups

Resource-based policies → attached to resources (like S3 bucket policies)

AWS managed vs Customer managed vs Inline policies


In simple terms

IAM Role → Who is acting

Policy → What they’re allowed to do

Action → The specific API operation

Resource → What the action applies to

Policy → the permission document (JSON)

Role → the identity

Policy attachment → the act of linking the policy to the role so the role actually gets those permissions


Docker (tool & API)
   └── containerd (runtime)
         └── runc (low-level container execution)

Docker CLI: docker run nginx , request sends to Docker engine
Docker Engine is a service/daemon that receives  commands from the cli.
containerd
============
Docker Engine then asks containerd to actually manage the container lifecycle:
Start / stop / pause / delete containers.
Pull images.
Manage container snapshots (filesystem layers).

runc
=====
containerd uses runc to interact with the OS kernel.
runc is the low-level tool that actually creates namespaces, cgroups, and runs the container process.

CLI → your command
Docker Engine → interprets & manages high-level container stuff
containerd → handles container lifecycle
runc → actually starts the container process in Linux
