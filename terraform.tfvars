resgroups = {
  group_alpha = {
    name     = "rg-testonelawrence-westus2"
    location = "westus2"
    tags = {
      ApplicationName     = "ACETECHWEEK"
      AppTypeRole         = "RG"
      DataProtection      = "NotProtected"
      DRTier              = "None"
      Environment         = "ATS"
      Location            = "USW2Z"
      NotificationContact = "trevon.lawrence@cdw.com"
      ProductCostCenter   = "ATS"
      SupportResponseSLA  = "None"
      WorkloadType        = "WebServer"
      Owner               = "Trevon Lawrence"
    }
  }
}

vnet = {
  vnet_alpha = {
    name          = "myFirstvnet"
    address_space = ["10.0.0.0/16"]
    location      = "westus2"
  }
}

nic = {
  nic1 = {
    name = "nic1"
  }
}

ip_configuration = {
    ip-alpha = {
        name = "internal"
        private_ip_address_allocation = "Dynamic"
}
}

subnet = {
    subnet_1 = {
        name = "subnet_1"
        address_prefix = "10.0.1.0/24"
    }

     subnet_2 = {
        name = "subnet_2"
        address_prefix = "10.0.2.0/24"
    }

     subnet_3 = {
        name = "subnet_3"
        address_prefix = "10.0.3.0/24"
    }
}