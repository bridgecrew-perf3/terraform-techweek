

source "azure-arm" "first-pack-image"{
    tenant_id = "de9231de-45f4-4325-ae07-8ae72052517e"
    subscription_id = "7fef4dbc-1411-4bf2-b1da-0c276068b5d8"
    resource_group_name = "rg-testonelawrence-westus2"
    storage_account = "trevstore1"

    capture_container_name = "images"
    capture_name_prefix = "packer"

    os_type="Linux"
    image_publisher = "RedHat"
    image_offer     = "RHEL"
    image_sku       = "7-LVM"

    location = "westus2"
    vm_size = "Standard_B2ms"

}

build {
    sources = ["sources.azure-arm.first-pack-image"]

    provisioner "shell" {
        inline = ["echo Mannnnnnnn"]
}

}