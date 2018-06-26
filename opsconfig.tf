module "opsconfig" {
    source = "git@github.com:HappyPathway/OpsConfig.git"
    triggers = ["${azurerm_virtual_machine.avm.*.id}"]
    hosts = ["${azurerm_public_ip.api.*.ip_address}"]
    count = "${var.count}"
    azure_subscription = "${var.azure_subscription}"
    azure_tenant = "${var.azure_tenant}"
    azure_client = "${var.azure_client}"
    azure_secret = "${var.azure_secret}"
    service_port = "${var.service_port}"
    env = "${var.env}"
    system_user = "${var.system_user}"
    system_password = "${var.system_password}"
    datadog_key = "${var.datadog_api_key}"
}
