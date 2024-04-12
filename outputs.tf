# Salida para mostrar la IP pública de la instancia EC2 después del despliegue
output "public_ip_dev" {
  value = aws_instance.COBRANZAS_dev_instance.public_ip
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true # Marcar la salida como sensible
}