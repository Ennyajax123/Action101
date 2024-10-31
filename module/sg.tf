# Creating Security group for Frontend machine
resource "aws_security_group"sg_frontend1" {
  name = var.sg_name
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port   = var.sg_frontend1_ingress_port_1
      to_port     = var.sg_frontend1_ingress_port_1
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
     from_port   = var.sg_frontend1_ingress_port_2
     to_port     = var.sg_frontend1_ingress_port_2
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_security_group" "sg_frontend2" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_frontend2_ingress_port_1
    to_port     = var.sg_frontend2_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_frontend2_ingress_port_2
    to_port     = var.sg_frontend2_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Creating Security group for Backend machine.
resource "aws_security_group" "sg_backend1" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_backend1_ingress_port_1
    to_port     = var.sg_backend1_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_backend1_ingress_port_2
    to_port     = var.sg_backend1_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_backend2" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_backend2_ingress_port_1
    to_port     = var.sg_backend2_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_backend2_ingress_port_2
    to_port     = var.sg_backend2_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}