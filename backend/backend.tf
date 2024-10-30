# Creating a module to provision 2 Backend EC2 machines
module "create-me backend1" {
  source    = "../ACTION101-module/"
  node_name = var.backend1
  user_data  = file("./backend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.node_name_sg.id
  ingress_port_1 = var.port_1
  ingress_port_2 = var.port_2
}
module "create-me backend2" {
  source    = "../ACTION101-module/"
  node_name = var.backend2
  user_data  = file("./backend-install.sh")
  sg_name   = var.node_name_sg.id
  ingress_port_1 = var.port_1
  ingress_port_2 = var.port_2
}