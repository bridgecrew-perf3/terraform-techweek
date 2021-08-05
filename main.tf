provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resgroups["group_alpha"].name
  location = var.resgroups["group_alpha"].location
  tags     = var.resgroups["group_alpha"].tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet["vnet_alpha"].name
  address_space       = var.vnet["vnet_alpha"].address_space
  location            = var.vnet["vnet_alpha"].location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.vnet_subnet_1["subnet_1_alpha"].name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.vnet_subnet_1["subnet_1_alpha"].address_prefixes
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic["nic1"].name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.ip_configuration["ip-alpha"].name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.ip_configuration["ip-alpha"].private_ip_address_allocation
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "test-vm1"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B2ms"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

security_rule {
    name                        = "ssh"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "22"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
security_rule {
    name                        = "RDP"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "3389"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
security_rule {
    name                        = "http"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "trevasso1"{
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg1.id
}


resource "azurerm_storage_account" "trestore1" {
  name                     = "trevstore1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_container" "trevstorcontain" {
  name                  = "trevcontain"
  storage_account_name  = azurerm_storage_account.trestore1.name
  container_access_type = "private"
}

resource "azurerm_frontdoor" "trevep1" {
  name                                         = "trevep1"
  location                                     = "Global"
  resource_group_name                          = azurerm_resource_group.rg.name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "trevroute1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["trevep1"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "trevbe"
    }
  }

  backend_pool_load_balancing {
    name = "trevlb1"
  }

  backend_pool_health_probe {
    name = "trevhp1"
  }

  backend_pool {
    name = "trevbe"
    backend {
      host_header = "www.bing.com"
      address     = "www.bing.com"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "trevlb1"
    health_probe_name   = "trevhp1"
  }

  frontend_endpoint {
    name      = "trevep1"
    host_name = "trevep1.azurefd.net"
  }
}

resource "azurerm_app_service_plan" "trevappservplan1" {
  name                = "trevappserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "trevappserv1" {
  name                = "trevappservice"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.trevappservplan1.id

}