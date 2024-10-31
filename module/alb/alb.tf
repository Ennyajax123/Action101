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

# Creating Application load balancer
resource "aws_alb" "my_load_balancer" {
  name                       =  "${var.my_load_balancer}-alb"
  internal                   = false
  load_balancer_type         = "application"
  vpc_id                     = data.terraform_remote_state.remote.outputs.vpc_id
  subnets                    = [data.terraform_remote_state.remote.outputs.private_subnet_1, data.terraform_remote_state.remote.outputs.private_subnet_2]
  security_groups            = [aws_security_group.sg_alb.id]
  enable_deletion_protection = false

  tags = {

    Environment = "development"
  }
}

#create Security Group for Application Load Balancer

resource "aws_security_group" "sg_alb" {
  name   = [var.alb_sg_id]               
    vpc_id = data.terraform_remote_state.remote.outputs.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"] 
        } 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  } 
}
#Creating Target Groups for frontend1

resource "aws_alb_target_group" "frontend1-tg" {
  name     = "frontend-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id    = data.terraform_remote_state.remote.outputs.vpc_id    

health check{
    enabled   = true
    interval  = 300
    path = "/"
    timeout = 60
    matcher = 200
    healthy_threshold = 5
    unhealthy_threshold = 5
  }
  lifecycle {
    create_before_destroy = true
  }
}

#Create Listener

resource "aws_alb_listener" "my_load_balancer_ls" {
  load_balancer_arn = aws_alb_listener.my_load_balancer_ls.arn
  port              = "80"
  protocol          = "HTTP"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4" 

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.frontend1-tg.arn 
  }
}

resource "aws_alb_target_group_attachment" "frontend1_tg_attachemnet" {
  target_group_arn = aws_alb_target_group.frontend1.tg_attachment.arn
  target_id        = var.target1 
  port             = 80
}
resource "aws_alb_target_group_attachment" "tg_attachemnet_frontend_node_2" {
  target_group_arn = aws_alb_target_group.frontend-tg.arn
  target_id        = var.target2  
  port             = 80
}


data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "preciousajax123"
    key    = "env/vpc/terraform.tfstate"
    region = "eu-west-2"
  }
}

#create a listener on port 80 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
    port = 80
  protocol = "HTTP"
    default_action {
    type ="redirect"

      redirect {
      port = 443
        proptocol ="HTTPS"
      status_code = "HTTP_301"
    }
    }
}

#create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
   load_balancer_arn = aws_lb.my_load_balancer.arn
      port = 443
      protocol = "HTTPS"
      ssl_policy = "ELBSecuritypolicy.2016-08"
        default_action {
          type ="redirect"

     redirect {
        port = 443
        proptocol ="HTTPS"
        status_code = "HTTP_301"
      }
    }
}
# # Creating Application load balancer
# resource "aws_lb" "my_load_balancer" {
#     name = "${var.my-project_name}-alb"
#        internal = false
#      load_balancer_type = "application"
#     security_groups = [var.alb_sg_id]
#       subnets =[var.public_subnets-1 , var.public-subnets-2 , var.public-subnets-3]
#     enable_deletion_protection = false
#     tags = {
#    name = "${var.my-project_name}-alb"
#     }

#   }

