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

vnet_subnet_1 = {
  subnet_1_alpha = {
    name             = "subnet_1"
    address_prefixes = ["10.0.1.0/24"]
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