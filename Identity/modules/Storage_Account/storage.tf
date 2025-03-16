# modules/Storage_Account/storage.tf

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name    # Now directly using the passed variable
  location                 = var.resource_group_location  # Using the passed variable
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
