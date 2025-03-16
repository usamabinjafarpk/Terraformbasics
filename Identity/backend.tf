terraform {
  backend "azurerm" {
    storage_account_name = "tfstatefile15"
    container_name       = "tfstatefiles"
    key                  = "tfstatefiles.tfstate"
    access_key           = "-------------"
  }
}