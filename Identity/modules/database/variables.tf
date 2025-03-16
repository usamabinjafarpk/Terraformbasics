variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable sql_server_name {
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

