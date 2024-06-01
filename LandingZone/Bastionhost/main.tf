#Create a public IP for bastion host

resource "azurerm_public_ip" "pipBastion" {
  for_each            = var.jump_server
  name                = each.value.PIPname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#create a bastion host
resource "azurerm_bastion_host" "bastion" {
  for_each            = var.jump_server
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.Bastion_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pipBastion[each.key].id
  }
}
