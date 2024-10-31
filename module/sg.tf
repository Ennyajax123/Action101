# Creating Security group for Frontend machine
resource "aws_security_group" "sg_Frontend1" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Frontend1_ingress_port_1
    to_port     = var.sg_Frontend1_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Frontend1_ingress_port_2
    to_port     = var.sg_Frontend1_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_Frontend2" {
  name = var.security_group_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Frontend2_ingress_port_1
    to_port     = var.sg_Frontend2_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Frontend2_ingress_port_2
    to_port     = var.sg_Frontend2_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Creating Security group for Backend machine.
resource "aws_security_group" "sg_Backend1" {
  name = var.security_group_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Backend1_ingress_port_1
    to_port     = var.sg_Backend1_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Backend1_ingress_port_2
    to_port     = var.sg_Backend1_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_Backend2" {
  name = var.security_group_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Backend2_ingress_port_1
    to_port     = var.sg_Backend2_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.sg_Backend2_ingress_port_2
    to_port     = var.sg_Backend2_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}