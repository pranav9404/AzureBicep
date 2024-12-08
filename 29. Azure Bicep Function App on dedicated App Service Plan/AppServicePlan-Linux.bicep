param pAppServicePlanName string
param pLocation string
param pSKUCapacity int
param pSKUName string
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlanName
  location: pLocation
  kind: 'linux'
  properties:{
    reserved: true
  }
  sku: {
    name: pSKUName
    capacity: pSKUCapacity
  }
}
output AppServicePlanId string = appServicePlan.id
