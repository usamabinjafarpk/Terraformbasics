module "resource_group" {
  source              = "./modules/Resource_Group"
  resource_group_name = "example-resources"
  location            = "East US"
}

module "storage_account" {
  source                   = "./modules/Storage_Account"
  storage_account_name     = var.storage_account_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  resource_group_name      = module.resource_group.resource_group_name
  resource_group_location  = module.resource_group.resource_group_location
}

module "keyvault" {
  source                   = "./modules/keyvault"
  keyvault_name            = var.keyvault_name
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  soft_delete_enabled      = var.soft_delete_enabled
  purge_protection_enabled = var.purge_protection_enabled
}

module "database" {
  source                       = "./modules/database" # Use local path for the module
  resource_group_name          = module.resource_group.resource_group_name
  resource_group_location      = module.resource_group.resource_group_location
  sql_server_name              = var.sql_server_name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

