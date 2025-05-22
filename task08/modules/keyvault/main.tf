resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name
  tags                = var.tags
}

data "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.kv.id
  object_id    = var.current_user_object_id
  tenant_id    = var.tenant_id
  depends_on   = [azurerm_key_vault.kv]
  count        = 1
}

resource "azurerm_key_vault_access_policy" "current_user" {
  count        = length(data.azurerm_key_vault_access_policy.current_user) == 0 ? 1 : 0
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.current_user_object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
  ]
}
