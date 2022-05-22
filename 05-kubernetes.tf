data "google_client_config" "primary" {
  depends_on = [google_container_cluster.primary]
}

provider "kubernetes" {
  host               = "https://${google_container_cluster.primary.endpoint}"
  token              = data.google_client_config.primary.access_token
  client_certificate = google_container_cluster.primary.master_auth.0.client_certificate
  client_key         = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth.0.cluster_ca_certificate,
  )
}

resource "kubernetes_deployment" "simple_api" {
  metadata {
    name = local.k8s_object_name
    labels = {
      app = local.k8s_object_name
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = local.k8s_object_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.k8s_object_name
        }
      }

      spec {
        container {
          image = "dejan1998/k8s-rollout-demo@${var.image_digest}"
          name  = local.k8s_object_name
          port {
            container_port = local.k8s_container_port
          }
          liveness_probe {
            http_get {
              path = "/version"
              port = local.k8s_container_port
            }

            initial_delay_seconds = 30
            period_seconds        = 15
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simple_api" {
  metadata {
    name = local.k8s_object_name
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = kubernetes_deployment.simple_api.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = local.k8s_container_port
    }
  }
}
