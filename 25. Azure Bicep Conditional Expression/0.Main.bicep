//tutorial 16 - parameter creation
param Env string ='dev'
param pAppServicePlan string 
param pAppService string 
param pAppInsights string 
param pSQLServer string 
param padministratorLogin string
@secure()
param padministratorLoginPassword string
param pSKUName string = (Env == 'dev')? 'F1': 'S1'
param pSKUCapacity int = (Env == 'dev')? 1:2

resource KeyVault 'Microsoft.KeyVault/vaults@2024-04-01-preview' existing = {
  name: 'azbicep-dev-eus-kv3'
}
//tutorial 15 - Modules
module AppServicePlan '2.AppServicePlan.bicep' =  {
  name: 'AppServicePlan'
  params: {
    pAppServicePlan: pAppServicePlan
    pAppService: pAppService
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    pSKUName:pSKUName
    pSKUCapacity: pSKUCapacity
    
  }
}

module SQLDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
    padministratorLogin: padministratorLogin
    padministratorLoginPassword: KeyVault.getSecret('sqladminpassword')
  }
}


module AppInsights '4.AppInsights.bicep' = {
  name:'AppInsights'
  params: {
    pAppInsights: pAppInsights
  }
}


