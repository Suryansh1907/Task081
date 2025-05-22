output "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Service cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}
output "aks_kube_config" {
  description = "The Kubernetes configuration for accessing the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
output "aks_kv_access_identity_id" {
  description = "The client ID of the AKS identity used for Key Vault access"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}
