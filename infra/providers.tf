terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-mgmt"
    storage_account_name = "sttfstate1230" # CHANGE TO YOURS
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    use_oidc             = true
  }
}
provider "azurerm" {
  features {}
  use_oidc = true
}