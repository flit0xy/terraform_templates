module "dzik-rg" {
  source              = "../modules/resource_group"
  resource_group_name = "dzik-rg"
  location            = "eastus"
}

module "dzik-acr" {
  source                  = "../modules/container_registry"
  container_registry_name = "dzikacr"
  location                = module.dzik-rg.location
  resource_group_name     = module.dzik-rg.name


}
module "dzik-cae" {
  source              = "../modules/container_app_env"
  container_app_name  = "dzik-cae"
  location            = module.dzik-rg.location
  resource_group_name = module.dzik-rg.name
}

module "dzik-ca" {
  source                       = "../modules/container_app"
  container_app_name           = "dzik-ca"
  location                     = module.dzik-rg.location
  resource_group_name          = module.dzik-rg.name
  container_name               = "dzik-container"
  container_image              = "${module.dzik-acr.login_server}/nginx:latest"
  cpu                          = "0.25"
  memory                       = "0.5Gi"
  container_app_environment_id = module.dzik-cae.container_app_environment_id
  environment                  = "development"
  target_port                  = 80
  external_enabled             = true
  latest_revision              = true
  scale = {
    min_replicas = 1
    max_replicas = 1
  }
  registry_server  = module.dzik-acr.login_server
  
  }

module "dzik-ca-role-assignment" {
  source               = "../modules/role_assignment"
  scope                = module.dzik-acr.container_registry_id
  role_definition_name = "AcrPull"
  principal_id         = module.dzik-ca.principal_id
}

