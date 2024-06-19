# #SQL Server
# resource "azurerm_mssql_server" "MSSQLServer" {
#   for_each = var.sqldbserv
#   name                         = each.value.server_name
# #  resource_group_name          = data.azurerm_resource_group.name
# #  location                     = data.azurerm_resource_group.location
#   resource_group_name          = each.value.rg_name
#   location                     = each.value.location
#   version                      = each.value.version
#   administrator_login          = each.value.administrator_login
#   administrator_login_password = each.value.administrator_login_password
# }

# resource "azurerm_mssql_database" "MSSQLDB" {
#   for_each = var.sqldbserv
#   name           = each.value.db_name
#   server_id      = azurerm_mssql_server.MSSQLServer[each.key].id
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   license_type   = "LicenseIncluded"
#   max_size_gb    = 4
#   read_scale     = true
#   sku_name       = "S0"
#   zone_redundant = true
#   enclave_type   = "VBS"
# }
