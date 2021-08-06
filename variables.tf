variable "resgroups" {
  type = map(object({
    name     = string
    location = string
    tags = object({
      ApplicationName     = string
      AppTypeRole         = string
      DataProtection      = string
      DRTier              = string
      Environment         = string
      Location            = string
      NotificationContact = string
      ProductCostCenter   = string
      SupportResponseSLA  = string
      WorkloadType        = string
      Owner               = string
    })
  }))
}

variable "vnet" {
  type = map(object({
    name          = string
    address_space = list(string)
    location      = string

  }))
}

variable "nic" {
  type = map(object({
    name = string
  }))
}

variable "ip_configuration" {
    type = map(object({
        name = string
        private_ip_address_allocation = string
    }))
}

variable "subnet" {
    type = map(object({
        name = string
        address_prefix = string
    }))
}