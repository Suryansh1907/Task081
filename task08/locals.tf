locals {
  name_prefix   = var.name_prefix
  rg_name       = "${local.name_prefix}-rg"
  aci_name      = "${local.name_prefix}-ci"
  acr_name      = "${replace(local.name_prefix, "-", "")}cr"
  aks_name      = "${local.name_prefix}-aks"
  keyvault_name = "${local.name_prefix}-kv"
  redis_name    = "${local.name_prefix}-redis"
  common_tags = {
    Creator = "suryansh_tilak@epam.com"
  }
}
