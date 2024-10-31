# Creating a module to provision 2 Frontend EC2 machines
module "frontend" {
  source    = "../ACTION101-module/"
  node_name = "frontend1"
  user_data  = file("./frontend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.frontend1_sg.id
  ingress_port_1 =var.sg_frontend1_ingress_port_1 
  ingress_port_2 = var.sg_frontend1_ingress_port_2
}
module "frontend-a" {
  source    = "../ACTION101-module/"
  node_name = "frontend2"
  user_data  = file("./frontend-install.sh")
  sg_name   = var.frontend2_sg.id
  ingress_port_1 = var.sg_frontend2_ingress_port_1
  ingress_port_2 = var.sg_frontend2_ingress_port_2
}