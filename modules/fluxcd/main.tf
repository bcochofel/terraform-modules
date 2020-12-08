# terraform and providers versions
terraform {
  required_version = ">= 0.12.20"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.11.3"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 2.8.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 2.1.1"
    }
  }
}
