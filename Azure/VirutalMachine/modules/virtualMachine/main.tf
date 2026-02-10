resource "azurerm_linux_virtual_machine" "myDemoVM" {
  name                = var.vm
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = var.azurerm_network_interface

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_terra.pub")
  }

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

  connection {
    type        = "ssh"
    host        = var.azurerm_public_ip
    user        = "adminuser"
    private_key = file("~/.ssh/id_terra")
  }
  provisioner "file" {
    source = "app.py"
    destination = "/home/adminuser/app.py"
  }
}