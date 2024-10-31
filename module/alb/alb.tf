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
resource "aws_elb" "my_alb" {
  name               = "preciousajax123-terraform-elb"
  availability_zones = ["eu-west-2a", "eu-west-2b"]

  access_logs {
    bucket        = "ajax123"
    bucket_prefix = "precious"
    interval      = 60
  }

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = "8443"
      instance_protocol = "HTTPS"
      lb_port           = "8443"
      lb_protocol       = "HTTPS"
      ssl_certificate_id = "arn:aws:acm:us-east-1:xxxxxxxxxxxxxx:certificate/xxxxxxxxxxxxxxxxxxxxxxxxxx"                                                                    
    },
  ]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.foo.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "preciousajax123-terraform-elb"
  }
}