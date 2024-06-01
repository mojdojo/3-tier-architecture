# Create public IPs
resource "azurerm_public_ip" "my_Public_ip" {
  for_each = var.linux_vms

  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Dynamic"
}
# Create network interface
resource "azurerm_network_interface" "my_nic" {
  for_each = var.linux_vms

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {

    name                          = "my_nic_configuration"
    subnet_id                     = data.azurerm_subnet.Frontend_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_Public_ip[each.key].id
  }
}
#Create virtual machine
resource "azurerm_linux_virtual_machine" "moduleVM" {
  for_each                        = var.linux_vms
  name                            = each.value.vm_name
  admin_username                  = each.value.vm_admin
  admin_password                  = each.value.vm_password
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  network_interface_ids           = [azurerm_network_interface.my_nic[each.key].id, ]
  size                            = each.value.vm_size
  disable_password_authentication = false

  os_disk {
   # name                 = each.value.os_disk.name
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  # boot_diagnostics {
  #   storage_account_uri = azurerm_storage_account.my_storage.primary_blob_endpoint
  # }
  # # Create Network Security Group and rules
  # resource "azurerm_network_security_group" "my_nsg" {
  #   name                = "my_NSG"
  #   location            = azurerm_resource_group.rg_Name.location
  #   resource_group_name = azurerm_resource_group.rg_Name.name

  # #For Windows
  #   security_rule {
  #     name                       = "RDP"
  #     priority                   = 1000
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "*"
  #     source_port_range          = "*"
  #     destination_port_range     = "3389"
  #     source_address_prefix      = "*"
  #     destination_address_prefix = "*"
  #   }

  #  For Linux
  # security_rule {
  #   name                       = "ssh"
  #   priority                   = 1001
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }
  #}

  # # Connect the security group to the network interface
  # resource "azurerm_network_interface_security_group_association" "example" {
  #   network_interface_id      = azurerm_network_interface.my_nic.id
  #   network_security_group_id = azurerm_network_security_group.my_nsg.id
  # }

}
