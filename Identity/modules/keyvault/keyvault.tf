resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  purge_protection_enabled    = var.purge_protection_enabled
  tenant_id                   = "-----"
  sku_name = "standard"
}


resource "azurerm_key_vault_secret" "first_secret" {
  name         = "first-secret" 
  value        = format("abchjv%sjgwvc", formatdate("YYYY-MM-DD", timestamp())) # Format today's date
  key_vault_id = azurerm_key_vault.keyvault.id
}
