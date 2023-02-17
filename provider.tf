terraform {
  required_version = ">= 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

provider "azurerm" {
  #  Caution
  # The ability to specify your Azure subscription credentials in a Terraform configuration file can be convenient - especially when testing. However, it isn't advisable to store credentials in a clear-text file that can be viewed by non-trusted individuals.
  subscription_id = var.subscription_id
  client_id       = var.app_id
  client_secret   = var.password
  tenant_id       = var.tenant
  features {}
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/drewlearns0145"
  personal_access_token = var.azdo_pat
}

provider "kubernetes" {
  alias = "dv"

  host                   = data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.host
  username               = data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.username
  password               = data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.target_cluster_dv.kube_config.0.cluster_ca_certificate)
}

