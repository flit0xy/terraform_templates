provider "azurerm" {
  features {}
  subscription_id = "0d31639b-710c-4b88-985e-b83f596c7353"
}

module "rg-prod" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-prod"
  location            = "northeurope"
}

module "rg-dev" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-dev"
  location            = "northeurope"
}
module "networking-prod" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-prod"
  address_space       = ["10.0.0.0/16"]
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
}

module "subnet-prod" {
  source              = "./modules/subnet"
  subnet_name         = "subnet-prod"
  address_prefixes    = ["10.0.1.0/24"]
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
  vnet_name           = module.networking-prod.vnet_name
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = "nsg-prod"
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = module.subnet-prod.subnet_id
  network_security_group_id = module.nsg.nsg_id

}
module "linux_vm" {
  source               = "./modules/linux_vm"
  vm_name              = "linux-vm-prod"
  location             = module.rg-prod.location
  resource_group_name  = module.rg-prod.name
  admin_username       = "azureuser"
  admin_ssh_key        = file("C:/Users/Walid/.ssh/id_rsa.pub")
  vm_size              = "Standard_D2s_v3"
  subnet_id            = module.subnet-prod.subnet_id
  network_interface_id = module.linux_vm.network_interface_id
}
module "webapp-prod" {
  source              = "./modules/webapp"
  web_app_name        = "webapp-prod-12345"
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
  service_plan_id     = module.webapp-prod.service_plan_id
  service_plan_name   = "asp-prod"
  web_app_id          = module.webapp-prod.web_app_id
  app_settings = {
    "ENVIRONMENT" = "PRODUCTION"
    "VERSION"     = "1.0.0"
  }
}
module "container_app" {
  source                       = "./modules/container_app"
  location                     = module.rg-prod.location
  resource_group_name          = module.rg-prod.name
  container_app_name           = "container-app-prod"
  container_app_environment_id = module.container_app.container_app_env
  container_name               = "mycontainer"
  container_image              = "nginx:latest"
  cpu                          = "0.5"
  memory                       = "1.0Gi"
  environment                  = "PRODUCTION"
}

module "aks-prod" {
  source              = "./modules/aks"
  aks_cluster_name    = "aks-prod-cluster"
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
  dns_prefix          = "aksprod"
  node_count          = 3
  vm_size             = "Standard_DS2_v2"
}
module "private_endpoint" {
  source                = "./modules/private_endpoint"
  private_endpoint_name = "pe-webapp-prod"
  location              = module.rg-prod.location
  resource_group_name   = module.rg-prod.name
  subnet_id             = module.subnet-prod.subnet_id
  resource_id           = module.webapp-prod.web_app_id
  subresource_names     = ["sites"]
}
