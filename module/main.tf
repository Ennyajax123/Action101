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
  vpc_security_group_ids = [aws_security_group.frontend1-sg.id]
  subnet_id              = [aws_subnet.public_subnets_1.id]
  private_subnet         = [aws_private_subnet.private_subnets_1.id]

  tags = {
    Name = "My-frontend1"
  }
}
resource "aws_instance" "frontend2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2b"
   vpc_security_group_ids = [aws_security_group.frontend2-sg.id]
  subnet_id              = [aws_subnet.public_subnets_2.id]
  private_subnet         = [aws_private_subnet.private_subnets_2.id]

  tags = {
    Name = "My-frontend2"
  }
}

resource "aws_instance" "backend1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2a"
   vpc_security_group_ids = [aws_security_group.backend1-sg.id]
  subnet_id              = [aws_subnet.public_subnets_1.id]
  private_subnet         = [aws_private_subnet.private_subnets_1.id]
  tags = {
    Name = "My-Backend1"
  }
}
resource "aws_instance" "backend2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = "eu-west-2b"
  vpc_security_group_ids = [aws_security_group.backend2-sg.id]
  subnet_id              = [aws_subnet.public_subnets_1.id]
  private_subnet         = [aws_private_subnet.private_subnets_1.id]

  tags = {
    Name = "My-Backend2"
  }
}