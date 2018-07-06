output "ipaddress" {
  value = "${azurerm_public_ip.api.ip_address}"
}
