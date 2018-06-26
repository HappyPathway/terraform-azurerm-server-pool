# Configure the Azure Provider
provider "azurerm" { }

provider "consul" {
  address    = "${var.consul_host}"
  datacenter = "${var.consul_cluster}"
}

provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}