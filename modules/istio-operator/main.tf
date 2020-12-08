# terraform and providers versions
terraform {
  required_version = ">= 0.12.20"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.11.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1.2"
    }
  }
}
