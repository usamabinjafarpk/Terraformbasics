resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = "tfstate_file"
  location      = "northeurope"
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}


resource "azurerm_mssql_database" "sql_db" {
  name                = "mydatabase2"
  server_id           = azurerm_mssql_server.sql_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
}

resource "null_resource" "sql_query" {
  provisioner "local-exec" {
    command = <<-EOT
      sqlcmd -S ${azurerm_mssql_server.sql_server.fully_qualified_domain_name} -U ${var.administrator_login} -P ${var.administrator_login_password} -d mydatabase2 -Q "
        create user b_abc with password='usamabinjafar@123' 
ALTER ROLE db_owner ADD MEMBER b_abc;
      "
    EOT
  }

  depends_on = [azurerm_mssql_database.sql_db]
}
