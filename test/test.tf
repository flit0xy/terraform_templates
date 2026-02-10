module "sfd-rg" {
  source              = "../modules/resource_group"
  resource_group_name = "flit0xy-playground-sandbox"
  location            = "westeurope"

}
