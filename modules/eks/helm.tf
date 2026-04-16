resource "helm_release" "argocd" {
  depends_on = [null_resource.kube-config]
  name       = "helm-chart"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer"
    }
      ]
}