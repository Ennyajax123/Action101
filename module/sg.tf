# Creating Security group for Frontend machine
resource "aws_security_group" "Frontend1_sg" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Frontend1_sg_ingress_port_1
    to_port     = var.Frontend1_sg_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Frontend1_sg_ingress_port_2
    to_port     = var.Frontend1_sg_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Frontend2_sg" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Frontend2_sg_ingress_port_1
    to_port     = var.Frontend2_sg_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Frontend2_sg_ingress_port_2
    to_port     = var.Frontend2_sg_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Creating Security group for Backend machine.
resource "aws_security_group" "Backend1_sg" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Backend1_sg_ingress_port_1
    to_port     = var.Backend1_sg_ingress_port_1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Backend1_sg_ingress_port_2
    to_port     = var.Backend1_sg_ingress_port_2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Backend2_sg" {
  name = var.sg_name
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.Backend2_sg_ingress_port_1
    to_port     = var.Backend2_sg_ingress_port_1
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