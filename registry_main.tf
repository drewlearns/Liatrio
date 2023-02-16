resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_container_registry" "main" {
  name                = "containerRegistrydrewliatrio"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Standard"
  admin_enabled       = true
}

