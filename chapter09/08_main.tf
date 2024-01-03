resource "kubernetes_namespace" "example" {
  metadata {
    name = "example-namespace"
  }
}
resource "kubernetes_deployment" "example" {
  metadata {
    name      = "example-deployment"
    namespace = kubernetes_namespace.example.metadata.0.name
  }
  spec {
    replicas = 2
    template {
      metadata {
        labels = {
          app = "example"
        }
      }
      spec {
        container {
          name  = "example"
          image = "example-image:latest"
          port {
            name           = "http"
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "example" {
  metadata {
    name      = "example-service"
    namespace = kubernetes_namespace.example.metadata.0.name
  }
  spec {
    selector = kubernetes_deployment.example.spec.0.template.0.metadata.0.labels
    port {
      name        = "http"
      port        = 80
      target_port = "http"
    }
  }
}