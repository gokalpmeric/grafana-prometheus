provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

data "helm_repository" "prometheus_community" {
  name = "prometheus-community"
  url  = "https://prometheus-community.github.io/helm-charts"
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = data.helm_repository.prometheus_community.metadata[0].name
  chart      = "prometheus"
  namespace  = "monitoring"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}

data "helm_repository" "grafana" {
  name = "grafana"
  url  = "https://grafana.github.io/helm-charts"
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = data.helm_repository.grafana.metadata[0].name
  chart      = "grafana"
  namespace  = "monitoring"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = "admin"
  }
}

