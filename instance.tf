locals {
    image_location = "${join("_", split(" ", var.location))}"
}

data "azurerm_image" "image" {
  name                = "${var.service_name}-${var.service_version}"
  resource_group_name = "PackerConfigs"
}

resource "random_string" "name_extension" {
  length  = 8
  special = false
}

resource "azurerm_virtual_machine" "avm" {
  name                  = "${var.service_name}-avm${format("%03d", count.index + 1)}-${random_string.name_extension.result}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group}"
  network_interface_ids = ["${element(azurerm_network_interface.ani.*.id, count.index)}"]
  vm_size               = "${var.instance_size}"

  depends_on = [
    "azurerm_public_ip.api",
    "azurerm_network_interface.ani",
    "azurerm_managed_disk.amd",
  ]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  #storage_image_reference {
  #  publisher = "Canonical"
  #  offer     = "UbuntuServer"
  #  sku       = "16.04-LTS"
  #  version   = "latest"
  #}

  storage_image_reference {
    id = "${data.azurerm_image.image.id}"
  }
  storage_os_disk {
    name              = "${var.service_name}-os${format("%03d", count.index + 1)}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  # Optional data disks
  storage_data_disk {
    name              = "${var.service_name}-disk${format("%03d", count.index + 1)}"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "1023"
  }
  storage_data_disk {
    name            = "${element(azurerm_managed_disk.amd.*.name, count.index)}"
    managed_disk_id = "${element(azurerm_managed_disk.amd.*.id, count.index)}"
    create_option   = "Attach"
    lun             = 1
    disk_size_gb    = "${var.disk_size}"
  }
  os_profile {
    computer_name  = "${var.service_name}-${format("%03d", count.index + 1)}"
    admin_username = "${var.system_user}"
    admin_password = "${var.system_password}"
    custom_data    = "${var.user_data}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags {
    service     = "${var.service_name}"
    environment = "${var.env}"
  }
}
