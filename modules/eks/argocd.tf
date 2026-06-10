resource "helm_release" "argocd" {

  depends_on = [null_resource.kube-config, helm_release.nginx-ingress]

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set = [
    {
      name  = "server.ingress.enabled"
      value = true
    },
    {
      name  = "server.ingress.ingressClassName"
      value = "nginx"
    },
    {
      name  = "global.domain"
      value = "argocd-${var.env}.pdevops78.online"
    },
    {
      name  = "configs.params.server\\.insecure"
      value = true
    }
  ]
}