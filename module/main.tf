terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
}

 #Create a VPC
 resource "aws_vpc" "my-project-vpc" {
   cidr_block       = "192.168.0.0/16"
   instance_tenancy = "default"

   tags = {
     Name = "main"
   }
 }
 #creating the frontend system

resource "aws_security_group" "frontend-1-sg" {
  name = "ACTION101-frontend-1-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "frontend-1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-1-sg.id]
  tags = {
    Name = "frontend-1"
  }
}

# creating the frontend system

resource "aws_security_group" "frontend-2-sg" {
  name = "ACTION101-frontend-2-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "frontend-2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-2-sg.id]
  tags = {
    Name = "frontend-2"
  }
}

# creating the backend system
resource "aws_security_group" "backend-1-sg" {
  name = "ACTION101-backend-1-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "backend-1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.key_name
  user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-1-sg.id]
  tags = {
    Name = "backend-1"
  }
}

# creating the backend system
resource "aws_security_group" "backend-2-sg" {
  name = "ACTION101-backend-2-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
resource "aws_instance" "backend-2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.key_name
  user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-2-sg.id]
  tags = {
    Name = "backend-2"
  }
}





# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.73.0"
#     }
#   }

#   required_version = ">= 1.2.0"
# }

# provider "aws" {
#   region = "eu-west-2"
# }

# resource "aws_instance" "frontend1" {
#   ami                    = var.ami
#   instance_type          = var.instance-type
#   key_name               = var.key_name
#   availability_zone      = "eu-west-2a"
#   vpc_security_group_ids = [aws_security_group.frontend1-sg.id]
#   subnet_id              = [aws_subnet.public_subnets_1.id]
#   private_subnet         = [aws_private_subnet.private_subnets_1.id]

#   tags = {
#     Name = "My-frontend1"
#   }
# }
# resource "aws_instance" "frontend2" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   availability_zone      = "eu-west-2b"
#   vpc_security_group_ids = [aws_security_group.frontend2-sg.id]
#   subnet_id              = [aws_subnet.public_subnets_2.id]
#   private_subnet         = [aws_private_subnet.private_subnets_2.id]

#   tags = {
#     Name = "My-frontend2"
#   }
# }

# resource "aws_instance" "backend1" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   availability_zone      = "eu-west-2a"
#   vpc_security_group_ids = [aws_security_group.backend1-sg.id]
#   subnet_id              = [aws_subnet.public_subnets_1.id]
#   private_subnet         = [aws_private_subnet.private_subnets_1.id]
#   tags = {
#     Name = "My-Backend1"
#   }
# }
# resource "aws_instance" "backend2" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   availability_zone      = "eu-west-2b"
#   vpc_security_group_ids = [aws_security_group.backend2-sg.id]
#   subnet_id              = [aws_subnet.public_subnets_1.id]
#   private_subnet         = [aws_private_subnet.private_subnets_1.id]

#   tags = {
#     Name = "My-Backend2"
#   }
# }