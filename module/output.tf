output "frontend1_id" {
  value = aws_instance.frontend1.id
}

output "frontend2_id" {
  value = aws_instance.frontend2.id
}

output "Backend1_id" {
  value = aws_instance.Backend1.id
}

output "Backend2_id" {
  value = aws_instance.Backend2.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_id" {
  value = aws_vpc.main.id
}
