# creating vpc module
module "my-project-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-project-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]
  private_subnets = [var.private_subnets_1, var.private_subnets_2]
  public_subnets  = [var.public_subnets_1, var.public_subnets_2]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "Dev-Frontend"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = [aws_vpc.my-project-vpc.id]

  tags = {
    Name = "Dev-frontend-IGW"
  }
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = [aws_vpc.my-project-vpc.id]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Dev-frontend-Pub-RtTable"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = [aws_vpc.my-project-vpc.id]

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Dev-frontend-Private-RtTable"
  }
}

module "my-project-vpc-1" {
  source = "terraform-aws-modules/vpc/aws"

    name = "my-project-vpc-1"
      cidr = "192.168.0.0/16"

    azs = ["eu-west-2a", "eu-west-2b"]

    private_subnets         = [var.private_subnets_1, var.private_subnets_2]
    public_subnets          = [var.public_subnets_1, var.public_subnets_2]
    map_public_ip_on_launch = true

    enable_nat_gateway = false
    enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "Dev-Backend"
  }
}

resource "aws_internet_gateway" "igw-1" {
  vpc_id = [aws_vpc.my-project-vpc_1.id]

  tags = {
    Name = "Dev-backend-IGW"
  }
}

resource "aws_route_table" "pub_route_table1" {
  vpc_id = [aws_vpc.my-project-vpc_1.id]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

  tags = {
    Name = "Dev-backend-Pub-RtTable"
  }
}

resource "aws_route_table" "private_route_table1" {
  vpc_id = [aws_vpc.my-project-vpc_1.id]

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Dev-backend-Private-RtTable"
  }
}

resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnets.Public_Subnet_1.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnets.Public_Subnet_2.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "private_association_1" {
  subnet_id      = aws_subnet.Private_Subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_association_2" {
  subnet_id      = aws_subnet.Private_Subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}