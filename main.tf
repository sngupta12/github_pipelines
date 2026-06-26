variable"storage"{}

resource"azurerm_resource_group""rgt"{
    for_each= var.storage
    name=each.value.resource_group_name
    location=each.value.location

    }

    resource"azurerm_storage_account""store"{
    for_each= var.storage
    name=each.value.name
    resource_group_name = each.value.resource_group_name
    location=each.value.location
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type

    depends_on = [ azurerm_resource_group.rgt ]
   

}

