
param keyVaultName string 

param location string = resourceGroup().location


param enabledForDeployment bool = false

param enabledForDiskEncryption bool = false

param enabledForTemplateDeployment bool = false

param tenantId string = subscription().tenantId
param objectId string = 'e954008a-d281-45bb-9e5b-e88ce3103973'
param keysPermissions array = [
  'list'
]
param secretsPermissions array = [
  'list'
]


param skuName string = 'standard'

resource kv 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    tenantId: tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
        }
      }
    ]
    sku: {
      name: skuName
      family: 'A'
    }
    
  }
  tags: {
    Name: 'Devenv'
    Value: 'sat'
    
  }
}

