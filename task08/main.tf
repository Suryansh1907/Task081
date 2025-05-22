provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source                 = "./modules/keyvault"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
  keyvault_name          = local.keyvault_name
  sku_name               = var.keyvault_sku
  tenant_id              = data.azurerm_client_config.current.tenant_id
  current_user_object_id = data.azurerm_client_config.current.object_id
  tags                   = local.common_tags
}

module "redis" {
  source                        = "./modules/redis"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  redis_name                    = local.redis_name
  capacity                      = var.redis_capacity
  family                        = var.redis_family
  sku_name                      = var.redis_sku
  keyvault_id                   = module.keyvault.keyvault_id
  redis_hostname_secret_name    = var.redis_hostname_secret_name
  redis_primary_key_secret_name = var.redis_primary_key_secret_name
  tags                          = local.common_tags
  depends_on                    = [module.keyvault]
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  acr_name            = local.acr_name
  acr_sku             = var.acr_sku
  app_image_name      = var.app_image_name
  git_repo_url        = var.git_repo_url
  git_pat             = var.git_pat
  tags                = local.common_tags
  depends_on          = [azurerm_resource_group.rg]
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  aks_name            = local.aks_name
  node_pool_name      = var.node_pool_name
  node_count          = var.node_count
  node_size           = var.node_size
  os_disk_type        = var.os_disk_type
  acr_id              = module.acr.acr_id
  keyvault_id         = module.keyvault.keyvault_id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = local.common_tags
  depends_on          = [module.acr, module.keyvault]
}

module "aci" {
  source              = "./modules/aci"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  aci_name            = local.aci_name
  acr_login_server    = module.acr.acr_login_server
  acr_admin_username  = module.acr.acr_admin_username
  acr_admin_password  = module.acr.acr_admin_password
  app_image_name      = var.app_image_name
  redis_hostname      = module.redis.redis_hostname
  redis_primary_key   = module.redis.redis_primary_key
  tags                = local.common_tags
  depends_on          = [module.acr, module.redis]
}

provider "kubectl" {
  host                   = yamldecode(module.aks.aks_kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.aks_kube_config).clusters[0].cluster.certificate-authority-data)
}

provider "kubernetes" {
  host                   = yamldecode(module.aks.aks_kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.aks_kube_config).clusters[0].cluster.certificate-authority-data)
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.acr_login_server
    app_image_name   = var.app_image_name
    image_tag        = "latest"
  })
  wait       = true
  depends_on = [module.aks]
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.aks_kv_access_identity_id
    kv_name                    = module.keyvault.keyvault_name
    redis_url_secret_name      = var.redis_hostname_secret_name
    redis_password_secret_name = var.redis_primary_key_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })
  wait       = true
  depends_on = [module.aks, module.keyvault, module.redis]
}

resource "kubectl_manifest" "service" {
  yaml_body  = file("${path.module}/k8s-manifests/service.yaml")
  wait       = true
  depends_on = [module.aks, kubectl_manifest.deployment]
}

data "kubernetes_service" "app_service" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}
