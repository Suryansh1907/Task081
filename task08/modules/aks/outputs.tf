output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
output "aks_kv_access_identity_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}
