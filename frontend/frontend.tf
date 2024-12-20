# Creating a module to provision 2 Frontend EC2 machines
module "frontend-1" {
  source    = "../ACTION101-module/"
  node_name = "frontend-1"
  user_data  = file("./frontend-install.sh")
  vpc_id         = data.terraform_remote_state.remote.outputs.vpc_id
  subnet_id = data.terraform_remote_state.remote.outputs.public_subnet-1_id
  sg_name   = var.frontend1_sg.id
  ingress_port_1 =var.sg_frontend-1_ingress_port_1 
  ingress_port_2 = var.sg_frontend-1_ingress_port_2
}
module "frontend-2" {
  source    = "../ACTION101-module/"
  node_name = "frontend-2"
  user_data  = file("./frontend-install.sh")
  vpc_id         = data.terraform_remote_state.remote.outputs.vpc_id
  subnet_id = data.terraform_remote_state.remote.outputs.public_subnet-2_id
  sg_name   = data.terraform_remote_state.remote.outputs.frontend-2_sg_id
  ingress_port_1 = var.sg_frontend-2_ingress_port_1
  ingress_port_2 = var.sg_frontend-2_ingress_port_2
}
data "terraform_remote_state" "remote"{
  backend = "s3"
  config ={
    bucket = "preciousajax123"
    region = "eu-west-2"
  }
}