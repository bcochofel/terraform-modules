# terraform and providers versions
terraform {
  required_version = ">= 0.12.20"

  required_providers {
    null       = ">= 2.1.2"
    kubernetes = ">= 1.11.3"
  }
}
