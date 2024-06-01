#Resource Group module

module "module_Resourcegroup" {
  source = "../../LandingZone/ResourceGroup"
  rg_map = var.rg_map
}

#Storage module
module "module_storageAcc" {
  source      = "../../LandingZone/Storage"
  Storage_map = var.Storage_map
  depends_on  = [module.module_Resourcegroup]
}

#Vnet module

module "module_Vnet" {
  source     = "../../LandingZone/VNET"
  vnet_map   = var.vnet_map
  depends_on = [module.module_Resourcegroup]
}

#subnetnet module

module "module_Subnet" {
  source     = "../../LandingZone/Subnet"
  subnet_map = var.subnet_map
  depends_on = [module.module_Vnet]
}


#VM Module

module "module_Vm" {
  source     = "../../LandingZone/VirtualMachine"
  linux_vms  = var.linux_vms
  depends_on = [module.module_Subnet]
}

# #Server/DB module

# module "module_ServerDb" {
#   source     = "../../LandingZone/SQL_DB"
#   sqldbserv  = var.sqldbserv
#   depends_on = [module.module_Resourcegroup]
# }

#Bastion Host

module "module_Bastionhost" {
  source      = "../../LandingZone/Bastionhost"
  jump_server = var.jump_server
  depends_on  = [module.module_Subnet]
}
#KEYVAULT
module "module_keyvault" {
  source = "../../LandingZone/keyVault"
  #  jump_server = var.jump_server
  depends_on = [module.module_Resourcegroup]
}


