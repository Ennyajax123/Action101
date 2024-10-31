variable "instance_type" {}
variable "key_name" {}
variable "ami" {}
variable "az_number1" {}
variable "public_subnet-1" {
    default = "192.168.4.0/24"
}
variable "public_subnet-2" {
    default = "192.68.5.0/24"
}
variable "private_subnet-1" {
    default = "192.168.1.0/24"
}
variable "private_subnet-2" {
    default = "192.168.2.0/24"
}
variable "vpc" {
    default = "192.168.0.0/16"
}
