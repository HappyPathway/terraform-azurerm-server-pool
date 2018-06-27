resource "azurerm_network_interface" "ani" {
  name                = "${var.service_name}-${var.env}-ani${format("%03d", count.index + 1)}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  count               = "${var.count}"

  ip_configuration {
    name                          = "${var.service_name}-ani${format("%03d", count.index + 1)}"
    subnet_id                     = "${var.subnet}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${element(azurerm_public_ip.api.*.id, count.index)}"
  }
}
