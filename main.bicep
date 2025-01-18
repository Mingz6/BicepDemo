@allowed(['dev', 'test', 'prod'])
param environment string
param firstWebsite string

// The first web app must be deployed along with the main file.
// Cons: The first web app cannot be deployed independently; all three web apps must be deployed together.
module firstweb './staticwebapp.bicep' = {
  name: firstWebsite
  params: {
    staticSiteName: firstWebsite
    location: 'westus2'
    environment: environment
  }
}

// The second web app can be deployed independently using the main.json parameters file with the following CLI command.
// This means I don't need to run main.bicep to deploy everything when I only want to deploy the second web app.
// az deployment group create --resource-group rg-staticwebapp --template-file staticwebapp.bicep --parameters './main.json'
var mainParamsJson = loadTextContent('./main.json')
var mainParamsObj = json(mainParamsJson).parameters
var secondServiceName = mainParamsObj.secondServiceName.value
var secondServiceenvironmen = mainParamsObj.environment.value
module secondweb './staticwebapp.bicep' = {
  name: secondServiceName
  params: {
    staticSiteName: secondServiceName
    location: 'westus2'
    environment: secondServiceenvironmen
  }
}

// I am looking for a way to deploy the third web app independently using the mainproblem.bicepparam file.
var mainParamsBicep = loadTextContent('./mainproblem.bicepparam')
// Problem is here and the mainParamsBicep is massive string cannot be used as an object
// var thirdServiceNameBicep = mainParamsBicep.???.???

var thirdServiceName = 'third-static-web-app-name'
// az cli is ????
module thirdweb './staticwebapp.bicep' = {
  name: thirdServiceName
  params: {
    // Cannot load the name from bicepparam file
    // staticSiteName: thirdServiceNameBicep
    staticSiteName: thirdServiceName

    location: 'westus2'
    environment: environment
  }
}
