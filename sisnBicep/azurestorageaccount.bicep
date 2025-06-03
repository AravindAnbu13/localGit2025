param StorageAccountName string = 'demoredisstorage324'
param location string = resourceGroup().location
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
   name: StorageAccountName
  location:location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
output StorageAccountID string = storageaccount.id

