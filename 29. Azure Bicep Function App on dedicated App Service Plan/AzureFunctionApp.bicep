
param pLocation string 
param pServerFarmsId string
param pFunctionAppName string
param pstorageAccountName string
param pstorageAccountID string
resource azureFunction 'Microsoft.Web/sites@2020-12-01' = {
  name: pFunctionAppName
  location: pLocation
  kind: 'functionapp'
  properties: {
    serverFarmId: pServerFarmsId
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsDashboard'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageAccountName};AccountKey=${listKeys(pstorageAccountID, '2021-06-01').keys[0].value}'
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageAccountName};AccountKey=${listKeys(pstorageAccountID, '2021-06-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING' 
          value: 'DefaultEndpointsProtocol=https;AccountName=${pstorageAccountName};AccountKey=${listKeys(pstorageAccountID, '2021-06-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(pFunctionAppName)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: 'e4c0db8f-ab25-432c-b9e9-3a5db2c3c86a'
          //value: reference('insightsComponents.id', '2015-05-01').InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
      ]
    }
  }
}
