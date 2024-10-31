terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "frontend1" {
  ami                    = var.ami
  instance_type          = var.instance-type
  key_name               = var.key_name
  availability_zone      = "eu-west-2a"
  vpc_security_group_ids = aws_security_group.sg_node.id
  subnet_id              = var.public_subnets_1
  private_subnet  = var.private_subnets_1
  security_group = aws_security_group.Frontend1_sg

  tags = {
    Name = "My-frontend1"
  }
}
resource "aws_instance" "frontend2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2b"
  vpc_security_group_ids = [aws_security_group.sg_node.id]

  tags = {
    Name = "My-frontend2"
  }
}

resource "aws_instance" "backend1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2a"
  vpc_security_group_ids = [aws_security_group.Backend1.id]

  tags = {
    Name = "My-Backend1"
  }
}
resource "aws_instance" "backend2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2b"
  vpc_security_group_ids = [aws_security_group.Backend2.id]

  tags = {
    Name = "My-Backend2"
  }
}

# Create a new load balancer attachment
resource "aws_elb_attachment" "alb" {
  elb      = aws_elb.alb.id
  instance = aws_instance.node_name.id
}