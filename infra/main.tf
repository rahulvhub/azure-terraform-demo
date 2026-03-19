resource "azurerm_resource_group" "app" {
  name     = "rg-webapp-prod"
  location = "Central US"
}

resource "azurerm_service_plan" "plan" {
  name                = "asp-mywebapp"
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
  os_type             = "Linux"
  sku_name            = "B1" 
}

resource "azurerm_linux_web_app" "web" {
  name                = "webapp-unique-name-2026" # CHANGE TO BE UNIQUE
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
  service_plan_id     = azurerm_service_plan.plan.id
  site_config {}
}