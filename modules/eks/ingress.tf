resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-config]
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  set = [
    {
      name = "controller.metrics.enabled"
      value = true
    },
    {
      name = "controller.podAnnotations.prometheus\\.io/port"
      value = 10254
    },
    {
      name = "controller.podAnnotations.prometheus\\.io/scrape"
      value = true
    }
  ]
}


# * controller.podAnnotations.prometheus\\.io/port=10254
# * controller.podAnnotations.prometheus\\.op/scrape=true

