resource "helm_release" "nginx-ingress" {
  depends_on                 = [null_resource.kube-config]
  name                       = "f5-nginx-ingress"
  repository                 = "https://helm.nginx.com/stable"
  chart                      = "nginx-ingress"
  disable_openapi_validation = true
  values                     = [file("${path.module}/ingress_values.yaml")]

  # Correct Block Syntax: Use individual nested blocks instead of an array
  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }

  set {
    name  = "controller.podAnnotations.prometheus\\.io/port"
    value = "9113" # Kept at 9113 for the F5 metrics engine
  }

  set {
    name  = "controller.podAnnotations.prometheus\\.io/scrape"
    value = "true"
  }
}


# * controller.podAnnotations.prometheus\\.io/port=10254
# * controller.podAnnotations.prometheus\\.op/scrape=true

