# Creating a module to provision 2 Backend EC2 machines
module "backend" {
  source    = "../ACTION101-module/"
  node_name = "backend1"
  user_data  = file("./backend-install.sh")
  vpc_id         = module.vpc_1.vpc_id
  sg_name   = var.backend1_sg.id
  ingress_port_1 = var.sg_backend1_ingress_port_1
  ingress_port_2 =var.sg_backend1_ingress_port_2
}
module "backend-a" {
  source    = "../ACTION101-module/"
  node_name = "backend2"
  user_data  = file("./backend-install.sh")
  sg_name   = var.backend2_sg.id
  ingress_port_1 = var.sg_backend2_ingress_port_1
  ingress_port_2 = var.sg_backend2_ingress_port_2
}