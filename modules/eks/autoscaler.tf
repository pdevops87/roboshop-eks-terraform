resource "helm_release" "autoscaler" {
  depends_on = [null_resource.kube-config, helm_release.nginx-ingress]
  name       = "cluster-autoscaler "
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscalerr"
  set = [
    {
      name = "autoDiscovery.clusterName"
      value = "dev-cluster"
    }
  ]
}