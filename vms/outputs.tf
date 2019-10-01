output "private_key" {
  value = tls_private_key.vms.private_key_pem
}

output "consul_server_addr" {
  value = azurerm_public_ip.consul_server.ip_address
}

output "consul_gateway_addr" {
  value = azurerm_public_ip.consul_gateway.ip_address
}

output "payment_addr" {
  value = azurerm_public_ip.payment.ip_address
}
