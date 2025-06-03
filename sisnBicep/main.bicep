
param AppservicePlan string = ''
param AppserviceName string  = 'Demowebapptest11'
param  appserviceappinsight string = 'demoappserviceinsight33'
param redisCacheName string = 'demorediswebapi321'
param serverName string = 'demobicepsqlserver'
param sqlDBName string = 'SampleDB3'
param serverlogin string = 'Admin123'
param serverpswd string =  'Administrator123'
param keyVaultName string = 'demoazbicepkeyvault12345'
param functionAppName string = 'demofunapp1234'
param funapplicationInsightsName string = 'demofunappinsight321'
param storageAccountName string = 'demofunappstracn'



module Appserviceonly 'Appserviceonly.bicep' = {
  name: AppserviceName
  params: {
    AppserviceName: AppserviceName
    appserviceappinsight: appserviceappinsight
  }
}
module Azurerediscache 'Azurerediscache.bicep' = {
  name: redisCacheName
  params: {
    redisCacheName: redisCacheName
  }
}

module Azuresqldb 'Azuresqldb.bicep' = {
  name: serverName
  params: {
    serverlogin: serverlogin
    serverName: serverName
    serverpswd: serverpswd
    sqlDBName: sqlDBName
  }
}
module Azurekeyvault 'Azurekeyvault.bicep' = {
  name: keyVaultName
  params: {
    keyVaultName: keyVaultName
  }
}
module Azurefunctionapp2 'Azurefunctionapp2.bicep' = {
  name: functionAppName
  params: {
    funapplicationInsightsName: funapplicationInsightsName
    functionAppName: functionAppName
    storageAccountName: storageAccountName
  }
}
  