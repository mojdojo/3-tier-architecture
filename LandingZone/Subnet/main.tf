# Create subnet
resource "azurerm_subnet" "Subnetname" {
  for_each = var.subnet_map

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

#Create Bastion subnet
resource "azurerm_subnet" "Bastion_subnet" {
  #  for_each             = var.subnet_map
  name                 = "AzureBastionSubnet"
  resource_group_name  = "manishRG2"
  virtual_network_name = "MyVnet_module1"
  address_prefixes     = ["10.0.4.0/24"]
}                                                                                                                                 