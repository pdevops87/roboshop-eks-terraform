# roboshop-eks-terraform
to create cluster and node groups

With triggers: You tell Terraform: "If the cluster_name changes, run this script again

to connect argocd through cli (linux server)
=============================================
curl -sSL -o argocd-linux-amd64 https://github.com
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64


login through cli
--------------------
argocd login "LB" --insecure --username admin --password "pawd"
argocd app create cart --repo https://github.com/pdevops87/roboshop-helm-v1.git --path . --dest-namespace default --dest-server https://kubernetes.default.svc  --values pass-templates/cart.yaml
argocd app sync cart
argocd app wait cart(progressing..)
argocd app wait cart --timeout 30(this is a health check)


cat /etc/nginx/conf.d/default.conf


