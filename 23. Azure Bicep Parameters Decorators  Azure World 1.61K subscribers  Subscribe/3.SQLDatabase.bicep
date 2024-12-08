param pSQLServer string 
param padministratorLogin string
@secure()
param padministratorLoginPassword string

// tutorial 13- Create Logical SQL Server and SQL Database
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: pSQLServer
  location: resourceGroup().location
  properties:{
    administratorLogin: padministratorLogin
    administratorLoginPassword: padministratorLoginPassword
  }
}

//tutorial 14 -Whitelist IP Address for Azure SQL Database
resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: sqlServer
  name: 'Pranav IP Address'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: 'database1'
  location: resourceGroup().location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}
