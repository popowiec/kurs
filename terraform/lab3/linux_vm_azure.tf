
resource "azurerm_resource_group" "gwiktorowski" {
  name     = "gwiktorowski-resources"
  location = "westeurope"
}

resource "azurerm_virtual_network" "gwiktorowski" {
  name                = "gwiktorowski-network"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.gwiktorowski.location
  resource_group_name = azurerm_resource_group.gwiktorowski.name
}

resource "azurerm_subnet" "gwiktorowski" {
  name                 = "gwiktorowski-private"
  resource_group_name  = azurerm_resource_group.gwiktorowski.name
  virtual_network_name = azurerm_virtual_network.gwiktorowski.name
  address_prefixes     = ["10.2.1.0/24"]
}

resource "azurerm_network_interface" "gwiktorowski" {
  name                = "gwiktorowski-nic"
  location            = azurerm_resource_group.gwiktorowski.location
  resource_group_name = azurerm_resource_group.gwiktorowski.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.example.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "gwiktorowski" {
  name                = "gwiktorowski-vm"
  resource_group_name = azurerm_resource_group.gwiktorowski.name
  location            = azurerm_resource_group.gwiktorowski.location
  size                = "Standard_DS1_v2"
  admin_username      = "gwiktorowski"
  password            = "gwiktorowski-1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.gwiktorowski.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
