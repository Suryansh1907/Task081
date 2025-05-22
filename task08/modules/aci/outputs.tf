output "aci_fqdn" {
  description = "The fully qualified domain name of the Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}
