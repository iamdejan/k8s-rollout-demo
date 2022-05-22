provider "kubernetes" {
  load_config_file = "false"

  host     = google_container_cluster.primary.endpoint
  username = ""
  password = ""

  client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
  client_key             = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}

resource "kubernetes_deployment" "simple_api" {
  metadata {
    name = "${local.k8s_object_name}-deployment"
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
          image = "asia.gcr.io/${var.project_id}/k8s-rollout-demo@${var.image_digest}"
          name  = local.k8s_object_name
          port {
            container_port = local.k8s_container_port
          }

          liveness_probe {
            http_get {
              path = "/version"
              port = local.k8s_container_port
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
