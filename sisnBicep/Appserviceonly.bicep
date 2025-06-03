
param AppserviceName string 
param location string = resourceGroup().location
param appserviceappinsight string 

resource azbicepappservice 'Microsoft.Web/sites@2021-01-15' = {
  name: AppserviceName
  location: location
  properties: {
    serverFarmId: 'demoappserplan54321'
  }
}

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: appserviceappinsight
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

