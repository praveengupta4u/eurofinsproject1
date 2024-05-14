# keyword function name of function -- this is not for providers
resource "azurerm_resource_group" "praveen-rg1" {
 name = "rg1" 
 location = "Central US"
}

# using exsting resource group
data "azurerm_resource_group" "existing_rg" {
    name = "rg2"
}