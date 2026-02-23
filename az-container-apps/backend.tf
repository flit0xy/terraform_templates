terraform {
  backend "azurerm" {
    resource_group_name  = "flit0xy-rg"
    storage_account_name = "dzikstoragetfstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
    use_azuread_auth     = true

  }
}
