using 'staticwebapp.bicep'

// By default it set to dev environment
@allowed(['dev' 'test' 'prod'])
param environment = 'dev'


param staticSiteName = 'third-static-web-app-name'

param location =  'westus2'
