# github provider
provider "github" {
  token      = var.github_token
  individual = true
}

# kubernetes provider
provider "kubernetes" {
  config_path    = var.kubectl_config_path
  config_context = var.kubectl_context
}

# helm provider
provider "helm" {
  kubernetes {
    config_path    = var.kubectl_config_path
    config_context = var.kubectl_context
  }
}
