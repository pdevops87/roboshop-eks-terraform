resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-config]
  name       = "f5-nginx-ingress"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  disable_openapi_validation = true
  values = [file("${path.module}/ingress_values.yaml")]
  set = [
    {
      name = "controller.metrics.enabled"
      value = true
    },
    {
      name = "controller.podAnnotations.prometheus\\.io/port"
      value = 9113
    },
    {
      name = "controller.podAnnotations.prometheus\\.io/scrape"
      value = true
    }
  ]
}


# * controller.podAnnotations.prometheus\\.io/port=10254
# * controller.podAnnotations.prometheus\\.op/scrape=true

