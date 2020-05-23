# terraform and providers versions
terraform {
  required_version = ">= 0.12.20"

  required_providers {
    github     = ">= 2.8.0"
    kubernetes = ">= 1.11.3"
    helm       = ">= 1.2.1"
    null       = ">= 2.1.2"
    tls        = ">= 2.1.1"
  }
}
