resource "azurerm_kubernetes_cluster" "this" {
  name                = var.prefix == "" ? "example-aks" : "${var.prefix}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "exampleaks1"

  #   default_node_pool {
  #     name       = "default"
  #     node_count = 1
  #     vm_size    = "Standard_D2_v2"
  #   }

  default_node_pool {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size
  }

  dynamic "identity" {
    for_each = var.enable_service_principal ? [] : [1]
    content {
      type = "SystemAssigned"
    }
  }

  dynamic "service_principal" {
    for_each = var.enable_service_principal ? [1] : []
    content {
      client_id     = "740eb6a8-577a-47b1-9a17-cc9688cd6f4d"
      client_secret = "aCg8Q~PsQ40Lz.oyFnjGIJgKgUvQb7SGm2tbMbbh"
    }
  }

  tags = {
    Environment = "Production"
  }
}
