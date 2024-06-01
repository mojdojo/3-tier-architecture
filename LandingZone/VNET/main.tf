# Create virtual network

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_map
  name                = each.value.vnet_name
  address_space       = ["10.0.0.0/16"]
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

}