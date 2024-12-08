

//tutorial no 5- creation of resource group
targetScope = 'subscription' // resource group comes under subscription

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: 'azbicep-dev-eus-rg1'
  location: 'westus'
}

resource azbicepresourcegroup1 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'azbicep-uat-eus-rg1'
  location: 'westus'
}
resource azbicepresourcegroup2 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'azbicep-stg-eus-rg1'
  location: 'westus'
}
resource azbicepresourcegroup3 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'azbicep-prd-eus-rg1'
  location: 'westus'
}


