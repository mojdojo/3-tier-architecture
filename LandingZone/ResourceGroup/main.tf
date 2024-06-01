#create a resource group

resource "azurerm_resource_group" "rgName" {
  for_each = var.rg_map
  name     = each.value.name
  location = each.value.location

}
