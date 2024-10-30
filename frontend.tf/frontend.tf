# Creating a module to provision 2 Frontend EC2 machines
module "create-me Frontend1" {
  source    = "./project-module/"
  node_name = var.Frontend1
  user_data  = file("./frontend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.sg_name_frontend1
  ingress_port_1 = var.Frontend1-port-1
  ingress_port_2 = var.Frontend1-port-2
}
module "create-me Frontend2" {
  source    = "./project-module/"
  node_name = var.Frontend2_name
  user_data  = file("./frontend-install.sh")
  sg_name   = var.Frontend2-sg-name.id
  ingress_port_1 = var.Backend2-port-1
  ingress_port_2 = var.Frontend2-port-2
}