# install prometheus
resource "helm_release" "prometheus" {
  depends_on = [null_resource.kube-config]
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  values = [file("${path.module}/prometheus-stack.yaml")]

  set = [
      {
      name = "grafana.enabled"
      value = false
    },
    {
      name = "prometheus.ingress.enabled"
      value = true
    },
    {
      name = "prometheus.ingress.ingressClassName"
      value = "nginx"
    },
  ]
  set_lists = [
    {
      name="prometheus.ingress.hosts"
      value=["prometheus-dev.pdevops78.online"]
    }
  ]
}



