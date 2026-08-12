variable "resource_group_name" {
  description = "Azure resource group name"
  type = string
}

variable "location" {
  description = "Region location"
  type = string
}

variable "VnetName" {
  description = "Name of the Virtual Network"
  type = string
}

variable "subnetName" {
  description = "Name of the Subnet"
  type = string
}

variable "nsg" {
  description = "Netowrk security group name"
  type = string
}