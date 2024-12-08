param pStorageAccountName string 
param pLocation string = resourceGroup().location

module StorageAccount_Module '5.StorageAccount.bicep' = {
  name: 'StorageAccount_Module'
  params: {
    pStorageAccountName: pStorageAccountName
    pLocation: pLocation
  }
}
