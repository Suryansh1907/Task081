resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build_task" {
  name                  = "${var.acr_name}-build-task"
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "application/Dockerfile"
    context_path         = var.git_repo_url
    context_access_token = var.git_pat
    image_names          = ["${var.app_image_name}:{{.Run.ID}}"]
  }
  timer_trigger {
    name     = "build-schedule"
    schedule = "0 0 * * *" # Run daily at midnight UTC
    enabled  = true
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "run_now" {
  container_registry_task_id = azurerm_container_registry_task.build_task.id
}
