# resource "azurerm_windows_virtual_machine" "winvm" {
#     name = "win1"
#     resource_group_name = azurerm_resource_group.praveen-rg1.name
#     location = azurerm_resource_group.praveen-rg1.location  
#     admin_username = "praveen"
#     admin_password = "Welcome@3214"
#     size = "Standard_D2s_v5"
#     network_interface_ids = [azurerm_network_interface.int1.id,]
    
#     os_disk {
#         caching              = "ReadWrite"
#     storage_account_type     = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
      
#     }
# }