param pAppServicePlan string 
param pAppService string
param pInstrumentationKey string
@description('''Please Provide the valid SKU Name. These are the allowed SKU Values
- S1
- F1
- B1
- D1
''')
@allowed(['S1','F1','B1','B2','D1'])
param pSKUName string

@minValue(1)
@maxValue(30)
param pSKUCapacity int

// tutorial 6 -app service plan
//for windows
resource azbicepasp1 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServicePlan
  location: resourceGroup().location
  sku: {
    name: pSKUName
    capacity: pSKUCapacity
  }
}
//tutorial 7 -app service plan
//for linux
// resource azbicepasp2 'Microsoft.Web/serverfarms@2020-12-01' = {
//   name: 'azbicep-dev-eus-asp-linux'
//   kind:'linux' //kind needs to be add
//   properties:{    //proprties needs to be add
//     reserved:true
//   }
//   location: resourceGroup().location
//   sku: {
//     name: 'S1'
//     capacity: 1
//   }
// }


//tutorial 8 -create app service
resource azbicepas 'Microsoft.Web/sites@2021-01-15' = {
  name: pAppService
  location: resourceGroup().location
  properties: {
    serverFarmId: azbicepasp1.id
  }
  dependsOn:[     //if you are adding two respurces in one bicep script, the you need to add the dependecy.
    azbicepasp1
  ]
}
//tutorial 11 - configure application setting in web app

resource azbicepwebappappsetting 'Microsoft.Web/sites/config@2024-04-01'= {
  name: 'web'
  parent: azbicepas
  properties:{
    appSettings:[
      //tutorial 12- integrate application insights with app services using instrumentation key 
      {
        name:'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: pInstrumentationKey
      }
      {
        name:'key1'
        value:'value1'
      }
    ]
  }
}


