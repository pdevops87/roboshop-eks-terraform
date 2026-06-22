resource "helm_release" "argocd" {
  depends_on = [null_resource.kube-config, helm_release.nginx-ingress]
  name       = "autoscaler "
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "autoscaler"
  set = [
    {
      name = "autoDiscovery.clusterName"
      value = "dev-cluster"
    }
  ]
}