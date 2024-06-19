data "azurerm_subnet" "Bastion_subnet" {
  for_each             = var.jump_server
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}