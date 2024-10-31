# Creating a module to provision 2 Frontend EC2 machines
module "create-me Frontend1" {
  source    = "../ACTION101-module/"
  node_name = var.frontend1
  user_data  = file("./frontend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.node_name_sg.id
  ingress_port_1 = var.port_1
  ingress_port_2 = var.port_2
}
module "create-me frontend2" {
  source    = "../ACTION101-module/"
  node_name = var.frontend2
  user_data  = file("./frontend-install.sh")
  sg_name   = var.node_name_sg.id
  ingress_port_1 = var.port_1
  ingress_port_2 = var.port_2
}