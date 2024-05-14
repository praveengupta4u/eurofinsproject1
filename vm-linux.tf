resource "azurerm_linux_virtual_machine" "linuxvm" {
    name = "linuxvm1"
    resource_group_name = data.azurerm_resource_group.existing_rg.name
    location = data.azurerm_resource_group.existing_rg.name
    size = "Standard_F2"
    network_interface_ids = [azurerm_network_interface.int1.nic1.id]
    admin_username = "praveen"
    admin_password = "Welcome@3214"
    os_disk {
      caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }
}