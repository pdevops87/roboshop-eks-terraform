resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-config]
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
}