variable "location" {
  default = "West US 2"
}

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

variable "resource_group" {}
variable "subnet_name" {}
variable "network_name" {}

variable "instance_size" {
  default = "Standard_DS1_v2"
}
