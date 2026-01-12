provider "azurerm" {
  features {}
  subscription_id = "0d31639b-710c-4b88-985e-b83f596c7353"
}

module "oshee-rg" {
  source              = "./modules/resource_group"
  resource_group_name = "oshee-prod-rg"
  location            = "northeurope"
}

module "oshee-hub-vnet" {
  source              = "./modules/vnet"
  vnet_name           = "oshee-hub-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.oshee-rg.location
  resource_group_name = module.oshee-rg.name
}

module "oshee-spoke1-vnet" {
  source              = "./modules/vnet"
  vnet_name           = "oshee-spoke1-vnet"
  address_space       = ["20.0.0.0/16"]
  location            = module.oshee-rg.location
  resource_group_name = module.oshee-rg.name
}
module "subnet-hub-1" {
  source              = "./modules/subnet"
  subnet_name         = "AzureFirewallSubnet"
  address_prefixes    = ["10.0.1.0/24"]
  location            = module.oshee-rg.location
  vnet_name           = module.oshee-hub-vnet.vnet_name
  resource_group_name = module.oshee-rg.name
}
module "subnet-spoke1" {
  source              = "./modules/subnet"
  subnet_name         = "s-vm"
  address_prefixes    = ["20.0.1.0/24"]
  location            = module.oshee-rg.location
  vnet_name           = module.oshee-spoke1-vnet.vnet_name
  resource_group_name = module.oshee-rg.name
}

module "peering_hub_to_spoke1" {
  source                    = "./modules/peering"
  peering_name              = "hub-to-spoke1"
  resource_group_name       = module.oshee-rg.name
  virtual_network_name      = module.oshee-hub-vnet.vnet_name
  remote_virtual_network_id = module.oshee-spoke1-vnet.vnet_id
}

module "peering_spoke1_to_hub" {
  source                    = "./modules/peering"
  peering_name              = "spoke1-to-hub"
  resource_group_name       = module.oshee-rg.name
  virtual_network_name      = module.oshee-spoke1-vnet.vnet_name
  remote_virtual_network_id = module.oshee-hub-vnet.vnet_id
}

module "linux_vm_oshee" {
  source               = "./modules/linux_vm"
  vm_name              = "oshee-linux-vm"
  location             = module.oshee-rg.location
  resource_group_name  = module.oshee-rg.name
  subnet_id            = module.subnet-spoke1.subnet_id
  admin_username       = "azureuser"
  admin_ssh_key        = file("C:/Users/Walid/.ssh/id_rsa.pub")
  vm_size              = "Standard_D2s_v3"
  network_interface_id = module.linux_vm_oshee.network_interface_id
}
module "oshee-udr-spoke1" {
  source              = "./modules/udr"
  route_table_name    = "oshee-spoke1-udr"
  location            = module.oshee-rg.location
  resource_group_name = module.oshee-rg.name
  subnet_id           = module.subnet-spoke1.subnet_id
  route_table_id      = module.oshee-udr-spoke1.route_table_id
  route = [
    {
      name                   = "to-internet"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.1.4"
  }]
}
module "associate-udr-subnet-spoke1" {
  source         = "./modules/udr-association"
  subnet_id      = module.subnet-spoke1.subnet_id
  route_table_id = module.oshee-udr-spoke1.route_table_id
}

module "oshee_public-ip" {
  source              = "./modules/Public-IP"
  public_ip_name      = "oshee-public-ip"
  location            = module.oshee-rg.location
  resource_group_name = module.oshee-rg.name
}

module "oshee-firewall" {
  source               = "./modules/firewall"
  firewall_name        = "oshee-firewall"
  location             = module.oshee-rg.location
  resource_group_name  = module.oshee-rg.name
  subnet_id            = module.subnet-hub-1.subnet_id
  public_ip_address_id = module.oshee_public-ip.public_ip_id
}
module "oshee-log-analytics" {
  source              = "./modules/loganalyticsws"
  workspace_name      = "oshee-log-analytics-ws"
  location            = module.oshee-rg.location
  resource_group_name = module.oshee-rg.name
  sku                 = "PerGB2018"
}

module "oshee-firewall-diagnostics" {
  source                     = "./modules/monitor_diagnostics_settings"
  diagnostic_setting_name    = "oshee-firewall-diagnostics"
  target_resource_id         = module.oshee-firewall.firewall_id
  log_analytics_workspace_id = module.oshee-log-analytics.log_analytics_workspace_id

  enabled_log = [
    {
      category = "AzureFirewallApplicationRule"
      enabled  = true
      retention_policy = {
        enabled = false
        days    = 0
      }
    },
    {
      category = "AzureFirewallNetworkRule"
      enabled  = true
      retention_policy = {
        enabled = false
        days    = 0
      }
    }
  ]

  metric = [
    {
      category = "AllMetrics"
      enabled  = true
      retention_policy = {
        enabled = false
        days    = 0
      }
    }
  ]
}