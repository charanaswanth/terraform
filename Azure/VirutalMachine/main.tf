module "rg" {
  source = "./modules/rg"
}

module "network" {
  source = "./modules/networking"
}

module "vm" {
  source = "./modules/virtualMachine"
}
