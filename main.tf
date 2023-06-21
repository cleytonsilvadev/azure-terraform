terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_k8s_aula" {
  name     = "rg_k8s_aula"
  location = "brazilsouth"
}

resource "azurerm_kubernetes_cluster" "aula_k8s" {
  name                = "aula-aks1"
  location            = azurerm_resource_group.rg_k8s_aula.location
  resource_group_name = azurerm_resource_group.rg_k8s_aula.name
  dns_prefix          = "live-cluster"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}