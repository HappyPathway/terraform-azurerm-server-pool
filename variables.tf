variable "location" {
    default = "West US 2"
}


variable "version" {}
variable "service_name" {
    default = "app"
}

variable "service_port" {
    default = "80"
}

variable "register_service" {
    default = true
}
variable "env" {
    default = "staging"
}

variable "count" {
    default = 1
}

variable "disk_size" {
    default = 1024
}

variable "system_user" {
    default = "admin"
}

variable "system_password" {
    default = "admin"
}

variable "datadog_api_key" {}
variable "datadog_app_key" {}

variable "ddog_install_script" {
    default = "https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh"
}

variable "datadog_monitor" {
    default = true
}

variable "consul_cluster" {
    default = "consul-westus"
} 

variable "consul_host" {
    default = "localhost:8500"
}

variable "azure_subscription" {} 
variable "azure_tenant" {}
variable "azure_client" {} 
variable "azure_secret" {}

variable "resource_group" {}
variable "subnet_name" {}
variable "network_name" {}
variable "instance_size" {
    default = "Standard_DS1_v2"
}