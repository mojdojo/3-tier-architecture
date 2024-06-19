#Data block to fetch subnet id

data "azurerm_subnet" "Frontend_subnet" {
  for_each = var.linux_vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network
  resource_group_name  = each.value.resource_group_name
} 

# data "azurerm_key_vault_secret" "username" {
#   name         = "username"
#   key_vault_id = data.azurerm_key_vault.existing.id
# }

# data "azurerm_key_vault_secret" "password" {
#   name         = "password"
#   key_vault_id = data.azurerm_key_vault.existing.id
# }

# data "azurerm_key_vault" "existing" {
#   name                = "mykeyvault"
#   resource_group_name = data.azurerm_resource_group.name
# }