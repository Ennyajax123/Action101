terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "preciousajax123"
    key    = "env/ACTION101/terraform.tfstate"
  }
}