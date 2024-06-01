rg_map = {
  rg1 = {
    name     = "manishRG2"
    location = "Canada Central"
  }

  rg2 = {
    name     = "manishRG3"
    location = "North Central US"
  }

}

Storage_map = {
  rg_Store1 = {
    name                     = "mystore1123"
    location                 = "Canada Central"
    resource_group_name      = "manishRG2"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }

  rg_Store2 = {
    name                     = "mystore1224"
    location                 = "Canada Central"
    resource_group_name      = "manishRG2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet_map = {
  vnet1 = {
    vnet_name           = "MyVnet_module1"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "manishRG2"
    location            = "Canada Central"
  }
  vnet2 = {
    vnet_name           = "MyVnet_module2"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "manishRG3"
    location            = "North Central US"
  }

}

subnet_map = {
  sub1 = {
    name                 = "module_frontendsubnet"
    resource_group_name  = "manishRG2"
    virtual_network_name = "MyVnet_module1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  sub2 = {
    name                 = "module_Backendsubnet"
    resource_group_name  = "manishRG2"
    virtual_network_name = "MyVnet_module1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}


linux_vms = {
  vm1 = {
    pip_name            = "module_PIP_FE"
    nic_name            = "module_my_NIC"
    vm_name             = "moduleVMFrontend"
    vm_size             = "Standard_DS1_v2"
    vm_admin            = "VM_Frontendmodule"
    vm_password         = "Azure1234"
    resource_group_name = "manishRG2"
    location            = "Canada Central"
    subnet_name         = "module_frontendsubnet"
    virtual_network     = "MyVnet_module1"

  }

  vm2 = {
    pip_name            = "module_PIP_BE"
    nic_name            = "module_nic_backend"
    vm_name             = "moduleVMBackend"
    vm_size             = "Standard_DS1_v2"
    vm_admin            = "VMbackend"
    vm_password         = "Azure1234"
    resource_group_name = "manishRG2"
    location            = "Canada Central"
    subnet_name         = "module_Backendsubnet"
    virtual_network     = "MyVnet_module1"

  }

}

# sqldbserv = {
#   sqldb1 = {
#     server_name                  = "mysqlserver"
#     db_name                      = "mysqldb"
#     rg_name                      = "manishRG2"
#     location                     = "Canada Central"
#     version                      = "12.0"
#     administrator_login          = "Manishserver"
#     administrator_login_password = "mani@123456"
#     name                         = "MSSQL-db"
#     account_tier                 = "Standard"
#     account_replication_type     = "LRS"
#   }
# }

jump_server = {
  bastion1 = {
    PIPname              = "bastionPIP"
    location             = "Canada Central"
    resource_group_name  = "manishRG2"
    bastionname          = "bastionhost"
    subnetname           = "AzureBastionSubnet"
    virtual_network_name = "MyVnet_module1"
  }
}