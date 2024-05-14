resource "azurerm_virtual_network" "vnet" {
    resource_group_name = azurerm_resource_group.praveen-rg1.name
    name = "vnet1"
    location = azurerm_resource_group.praveen-rg1.location
    address_space = [ "10.0.0.0/16" ]  
}
# Create subnet
resource "azurerm_subnet" "subnet" {
    name = "subnet1"
    virtual_network_name = azurerm_virtual_network.vnet.name
     resource_group_name = azurerm_resource_group.praveen-rg1.name
     address_prefixes = ["10.0.1.0/24"]
}
#create network interface
resource "azurerm_network_interface" "int1" {
    name = "nic1"
    resource_group_name = azurerm_resource_group.praveen-rg1.name
   location = azurerm_resource_group.praveen-rg1.location
   ip_configuration {
     name                          = "nic1-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip1.id
   }
}

resource "azurerm_public_ip" "publicip1" {
  name                = "PublicIp1"
  resource_group_name = azurerm_resource_group.praveen-rg1.name
  location            = azurerm_resource_group.praveen-rg1.location
  allocation_method   = "Static"
}


resource "azurerm_virtual_network" "vnet2" {
    resource_group_name = data.azurerm_resource_group.existing_rg.name
    name = "vnet1"
    location = data.azurerm_resource_group.existing_rg.location
    address_space = [ "172.0.0.0/16" ]  
}
# Create subnet
resource "azurerm_subnet" "subnet2" {
    name = "subnet2"
    virtual_network_name = azurerm_virtual_network.vnet2.name
     resource_group_name = data.azurerm_resource_group.existing_rg.location
     address_prefixes = ["172.0.1.0/24"]
}
#create network interface
resource "azurerm_network_interface" "int2" {
    name = "nic2"
    resource_group_name = data.azurerm_resource_group.existing_rg.name
   location = data.azurerm_resource_group.existing_rg.location
   ip_configuration {
     name                          = "nic2-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip1.id
   }
}

resource "azurerm_public_ip" "publicip2" {
  name                = "PublicIp2"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  allocation_method   = "Static"
}