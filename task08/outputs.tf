output "aci_fqdn" {
  description = "The fully qualified domain name of the Azure Container Instance for accessing the application"
  value       = module.aci.aci_fqdn
}

output "aks_lb_ip" {
  description = "The LoadBalancer IP address of the Azure Kubernetes Service for accessing the application"
  value       = data.kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip
}
