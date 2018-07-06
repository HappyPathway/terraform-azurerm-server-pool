resource "azurerm_public_ip" "api" {
  name                         = "${var.service_name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    environment = "${var.env}"
    service     = "${var.service_name}"
  }
}
