resource "azurerm_managed_disk" "amd" {
  name                 = "${var.service_name}-${var.env}-amd${format("%03d", count.index + 1)}"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "${var.disk_size}"
  count                = "${var.count}"
}