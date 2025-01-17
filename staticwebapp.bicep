// Use the following az cli to deploy second webapp with main.json parameters file
// az deployment group create --resource-group rg-staticwebapp --template-file staticwebapp.bicep --parameters './main.json'

param staticSiteName string
param location string
@allowed([ 'dev', 'test', 'prod' ])
param environment string
param tags object = {
  Application: 'ApplicationName'
  Environment: environment
}

resource staticSite 'Microsoft.Web/staticSites@2022-09-01' = {
  name: staticSiteName
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {}
}
