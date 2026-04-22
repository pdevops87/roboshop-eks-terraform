# install prometheus
resource "helm_release" "prometheus" {
  depends_on = [null_resource.kube-config]
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer"
  }
}


