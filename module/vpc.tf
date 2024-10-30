variable "igw" {}
variable "igw-1" {}
variable "vpc" {}
variable "vpc1" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "route_table" {}
variable "vpc_security_group" {}

# creating vpc module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my_vpc"
  cidr = "192.168.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]
  private_subnets = [var.private_subnets_1 , var.private_subnets_2]
  public_subnets  = [var.public_subnets_1 , var.public_subnets_2]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "Dev-Frontend"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Dev-frontend-IGW"
  }
}
resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Dev-Frontend-Pub-RtTable"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Dev-Frontend-Private-RtTable"
  }
}
module "vpc-1" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my_vpc_1"
  cidr = "192.168.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]

   private_subnets = [var.private_subnets_1 , var.private_subnets_2]
  public_subnets  = [var.public_subnets_1 , var.public_subnets_2]
  map_public_ip_on_launch = true

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "Dev-Backend"
  }
}
resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.my-vpc_1.id

  tags = {
    Name = "Dev-Backend-IGW"
  }
}
resource "aws_route_table" "pub_route_table1" {
  vpc_id = aws_vpc.my_vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

  tags = {
    Name = "Dev-Backend-Pub-RtTable"
  }
}
resource "aws_route_table" "private_route_table1" {
  vpc_id = aws_vpc.my_vpc_1.id

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Dev-Backend-Private-RtTable"
  }
}
resource "aws_route_table_association" "public_association_1" {
  subnet_id    = aws_subnets.Public_Subnet_1.id
  route_table_id = aws_route_table.pub_route_table.id
}
resource "aws_route_table_association" "public_association_2" {
  subnet_id    = aws_subnets.Public_Subnet_2.id
  route_table_id = aws_route_table.pub_route_table.id
}
resource "aws_route_table_association" "private_association_1" {
  subnet_id    = aws_subnet.Private_Subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_association_2" {
  subnet_id    = aws_subnet.Private_Subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}