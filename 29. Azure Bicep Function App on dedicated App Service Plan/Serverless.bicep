param pStorageAccountName string 
param pLocation string = resourceGroup().location
param pAppServicePlanName string
param pSKUCapacity int
param pSKUName string
param pFunctionAppName string

module StorageAccount_Module '5.StorageAccount.bicep' = {
  name: 'StorageAccount_Module'
  params: {
    pStorageAccountName: pStorageAccountName
    pLocation: pLocation
  }
}
module AppServicePlan_Linux 'AppServicePlan-Linux.bicep' = {
  name: 'AppServicePlan_Linux'
  params: {
    pAppServicePlanName: pAppServicePlanName
    pLocation: pLocation
    pSKUCapacity: pSKUCapacity
    pSKUName: pSKUName
  }
}

module FunctionApp 'AzureFunctionApp.bicep'= {
  name: 'FunctionApp'
  params: {
    pFunctionAppName: pFunctionAppName
    pLocation: pLocation
    pServerFarmsId: AppServicePlan_Linux.outputs.AppServicePlanId
    pstorageAccountID: StorageAccount_Module.outputs.StorageAccountId
    pstorageAccountName:pStorageAccountName
  }
}
