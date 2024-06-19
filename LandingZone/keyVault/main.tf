resource "azurerm_key_vault" "KeyVault" {
  name                        = "myKV241162"
  location                    = "Canada Central"
  resource_group_name         = "manishRG2"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Create",
      "Get", "List",]

    secret_permissions = ["Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"]
  
  storage_permissions = ["Get",]
  }
}
#random password Generator

resource "random_password" "randompass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "azurerm_key_vault_secret" "randomsec" {
  name         = "mySecret"
  value        = random_password.randompass.result
  key_vault_id = azurerm_key_vault.KeyVault.id
}

resource "azurerm_key_vault_secret" "deepsec" {
  name         = "mySecret"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.KeyVault.id
}