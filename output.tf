output "ip_address" {
  value = aws_instance.instance_terraform_simonet.*.public_ip
}
