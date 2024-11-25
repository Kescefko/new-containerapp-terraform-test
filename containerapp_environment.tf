resource "azurerm_container_app_environment" "container_app_environment" {
  name = "cae-gyorgy-shared-dev-neu"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location

  infrastructure_resource_group_name = "rg-infra-cae-gyorgy-shared-dev-neu"
  infrastructure_subnet_id = var.infrastructure_subnet_id_container_apps_environment
  internal_load_balancer_enabled = true

  workload_profile {
    minimum_count = "2"
    maximum_count = "4"
    name = "wp-cae-gyorgy-shared-dev-neu"
    workload_profile_type = "Consumption"
  }
}