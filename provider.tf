# Configure the Azure Provider
provider "azurerm" {}

provider "consul" {
  address    = "${var.consul_host}"
  datacenter = "${var.consul_cluster}"
}
