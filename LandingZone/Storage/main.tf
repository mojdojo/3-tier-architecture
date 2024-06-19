# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageacc" {
  for_each = var.Storage_map
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}