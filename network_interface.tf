data "azurerm_subnet" "test" {
  name                 = "${var.subnet}"
  virtual_network_name = "${var.network_name}"
  resource_group_name  = "${var.resource_group}"
}

resource "azurerm_network_interface" "ani" {
  name                = "${var.service_name}-ani${format("%03d", count.index + 1)}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "${var.service_name}-ani${format("%03d", count.index + 1)}"
    subnet_id                     = "${data.azurerm_subnet.test.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${element(azurerm_public_ip.api.*.id, count.index)}"
  }
}
