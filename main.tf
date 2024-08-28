locals {
  ipam_url   = var.ipam_url
  ipam_apiId = var.app_id
}

data "external" "get_access_token" {
  program = ["sh", "-c", <<-EOF

    az account get-access-token --resource api://${local.ipam_apiId} | jq -r 'to_entries | map({(.key): (.value | tostring)}) | add'
    EOF
  ]
  depends_on = [resource.null_resource.access_token]
}

# Create an ipam reservation
resource "azureipam_reservation" "multiclient-vnet" {
  space       = var.space
  block       = var.block
  size        = var.reservation_size
  description = var.reservation_description
  depends_on  = [data.external.get_access_token]
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-vnet-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = [azureipam_reservation.multiclient-vnet.cidr]
  tags          = azureipam_reservation.multiclient-vnet.tags 
}
