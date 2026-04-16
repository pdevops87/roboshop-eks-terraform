resource "helm_release" "argocd" {
  depends_on = [null_resource.kube-config]
  name       = "helm-chart"
  repository = "helm repo add argo https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer"
    }
      ]
}