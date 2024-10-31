output "frontend1_id" {
  value = aws_instance.frontend-1.id
}

output "frontend2_id" {
  value = aws_instance.frontend-2.id
}

output "Backend1_id" {
  value = aws_instance.backend-1.id
}

output "Backend2_id" {
  value = aws_instance.backend-2.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_id" {
  value = aws_vpc.main.id
}
