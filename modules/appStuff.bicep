// A "modules" folder which contains a module which deploys 2 storage accounts (using a loop). The inputs for the Storage account must be properly parametrized. "kind" and "accessTier" parameters must allow only valid values. The location default value is the same as the Resource Group.
// Storage account names must be : <yourname>finalexam1 and <yourname>finalexam2


param location string = resourceGroup().location
param appServiceAppName string
param appServicePlanName string
param dbhost string
param dbuser string
param dbpass string
param dbname string

var appServicePlanName_s = 'B1'

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanName_s
  }
  kind: 'linux'
}
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
name: appServiceAppName
location: location
properties: {
  serverFarmId: appServicePlan.id
  httpsOnly: true
  siteConfig: {
    appSettings: [
      {
        name: 'DBUSER'
        value: dbuser
      }
      {
        name: 'DBPASS'
        value: dbpass
      }
      {
        name: 'DBNAME'
        value: dbname
      }
      {
        name: 'DBHOST'
        value: dbhost
      }
    ]
  }
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
