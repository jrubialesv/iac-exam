// A main.bicep file which calls the aforementioned module once and additionally deploys an Azure App Service Plan (tier B1) and conditionally a Web App. 
// The Web App must be deployed only if a boolean parameter called deployApp is set to true.
// The Web App must include in the configuration a variable called MYSECRET.
// App Service Plan name: <your name>-asp
// Web App name: <your name>-app
// Storage Account name: jrubiales



param deployApp bool = true
param location string = resourceGroup().location
param storageAccountName string
param storageAccountSkuName string = 'Standard_LRS'
param storageAccountKind string = 'StorageV2'
param storageAccountAccessTier string = 'Hot'
param storageAccountEnableHttpsTrafficOnly bool = true
param storageAccountAllowBlobPublicAccess bool = false

// The Web App must be deployed only if a boolean parameter called deployApp is set to true.
