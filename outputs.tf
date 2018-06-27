output "ipaddresses" {
  value = "${azurerm_public_ip.avm.*.ip_address}"
}
