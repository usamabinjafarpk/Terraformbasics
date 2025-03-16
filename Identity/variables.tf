# variables.tf (root directory)

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "The replication strategy for the storage account"
  type        = string
}


#keyvault
variable "keyvault_name" {
  type        = string
  description = "description"
}

variable "soft_delete_enabled" {
  type        = bool
  description = "description"
}
variable "purge_protection_enabled" {
  type        = bool
  description = "description"
}

#db

variable "sql_server_name" {
  type        = string
  description = "description"
}


variable "administrator_login" {
  type        = string
  description = "description"
}

variable "administrator_login_password" {
  type        = string
  description = "description"
}


