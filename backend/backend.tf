# Creating a module to provision 2 Backend EC2 machines
module "backend-1" {
  source    = "../ACTION101-module/"
  node_name = "backend-1"
  user_data  = file("./backend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.backend--1_sg.id
  ingress_port_1 = var.sg_backend-1_ingress_port_1
  ingress_port_2 =var.sg_backend-1_ingress_port_2
}
module "backend-2" {
  source    = "../ACTION101-module/"
  node_name = "backend--2"
  user_data  = file("./backend-install.sh")
  sg_name   = var.backend2_sg.id
  ingress_port_1 = var.sg_backend-2_ingress_port_1
  ingress_port_2 = var.sg_backend-2_ingress_port_2
}