variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "Region where this cluster is located."
  default     = "asia-southeast2"
}

variable "image_digest" {
  description = "Digest of the newly-pushed image."
}
