output "keyvault_id" {
  description = "The ID of the Azure Key Vault"
  value       = azurerm_key_vault.kv.id
}
output "keyvault_name" {
  description = "The name of the Azure Key Vault"
  value       = azurerm_key_vault.kv.name
}
