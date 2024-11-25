resource "azurerm_container_app" "container_app" {
  name                         = "ca-gyorgy-shared-dev-neu"
  container_app_environment_id = azurerm_container_app_environment.container_app_environment.id
  resource_group_name          = data.azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = "devcontainerapp"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    exposed_port = 80
    target_port = 80

    traffic_weight {
      percentage = 100
    }
  }
}