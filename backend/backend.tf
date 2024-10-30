# Creating a module to provision 2 Backend EC2 machines
module "create-me backend1" {
  source    = "../week6-proj-module/"
  node_name = var.backend1_name
  user_data  = file("./frontend-install.sh")
  sg_name   = var.backend1_sg_name.id
  ingress_port_1 = var.backend1_ingress_port_1
  ingress_port_2 = var.backend1_ingress_port_2
}
module "create-me backend2" {
  source    = "../week6-proj-module/"
  node_name = var.backend2_name
  user_data  = file("./frontend-install.sh")
  sg_name   = var.backend2_sg_name.id
  ingress_port_1 = var.backend2_ingress_port_1
  ingress_port_2 = var.backend2_ingress_port_2
}