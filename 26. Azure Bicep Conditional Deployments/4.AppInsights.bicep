//tutorial 17 - Communication b/w Bicep modules using Output Parameters

param pAppInsights string

//tutorial no 10 - create app insights
resource azbicepappinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output oInstrumentationKey string =  azbicepappinsights.properties.InstrumentationKey
