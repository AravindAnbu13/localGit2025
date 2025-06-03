param AppservicePlan string
param AppserviceName string 
param location string = resourceGroup().location

resource bicepappServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: AppservicePlan
  kind: 'linux'
  properties: {
    reserved: true
  }
  location: location
  sku: {
      name: 'B1'
      capacity: 1
    }
}

resource azbicepappservice 'Microsoft.Web/sites@2021-01-15' = {
  name: AppserviceName
  location: location
  properties: {
    serverFarmId: 'myappserviceplantest31'
  }
}

