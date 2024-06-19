variable "rg_map" {
  description = "This is the variable created for rg"
  type        = map(any)
}

variable "Storage_map" {
  description = "This is the variable created for storage"
  type        = map(any)
}

variable "vnet_map" {
  description = "This is the variable created for vnet"
  type        = map(any)
}

variable "subnet_map" {
  description = "This is the variable created for subnets"
  type        = map(any)
}

variable "linux_vms" {
  description = "This is the map variable created for VM atrributes "
  type        = map(any)
}

# variable "sqldbserv" {
#   description = "This is the map variable created for SQL server and DB atrributes "
#   type        = map(any)
# }

variable "jump_server" {
  description = "This is the variable created for entities for Bastion subnet"
  type        = map(any)
}