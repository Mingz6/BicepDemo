using 'main.bicep'

// By default it set to dev environment
@allowed(['dev' 'test' 'prod'])
param environment = 'dev'


param firstWebsite = 'first-static-web-app-name'
