variable "ipam_url" {
  description = "URL of IPAM instance"
  type = string
}

variable "space" {
  description = "name of the existing space in the IPAM application."
  type = string
}

variable "block" {
  description = "name of the existing block, related to the specified space, in which the reservation is to be made."
  type = string
}

variable "size" {
  description = "subnet mask bits, which defines the size of the vnet to reserve"
  type = number
}

variable "reservation_description" {
  description = "description that describe the reservation"
  default = "VNet reservation"
  type = string
}

variable "vnetname" {
  description = "Name of the VNet which will be created"
  type = string
}

variable "location" {
  description = "Location of the Resource Group"
  type = string
}

variable "app_id" {
  description = "app id of ipam"
  type = string
}
