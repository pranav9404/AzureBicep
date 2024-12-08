//tutorial 16 - parameter creation
param pAppServicePlan string 
param pAppService string 
param pAppInsights string 
param pSQLServer string 
param padministratorLogin string
@secure()
param padministratorLoginPassword string

//tutorial 15 - Modules
module AppServicePlan '2.AppServicePlan.bicep' =  {
  name: 'AppServicePlan'
  params: {
    pAppServicePlan: pAppServicePlan
    pAppService: pAppService
    pInstrumentationKey: AppInsights.outputs.oInstrumentationKey
    
  }
}

module SQLDatabase '3.SQLDatabase.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
    padministratorLogin: padministratorLogin
    padministratorLoginPassword: padministratorLoginPassword
  }
}


module AppInsights '4.AppInsights.bicep' = {
  name:'AppInsights'
  params: {
    pAppInsights: pAppInsights
  }
}


