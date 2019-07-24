Login-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "JazureGrave Hub"

$registry = get-AzureRmContainerRegistry -Name jagcontainerregistry -ResourceGroupName JazureGrave-Hub-ContainerServices
$registry
$creds = Get-AzureRmContainerRegistryCredential -Registry $Registry
$creds
docker build -t "jagcontainerregistry.azurecr.io/pycont:latest" -f ".\dockerfile" .

docker login $Registry.LoginServer -u $creds.Username -p $creds.Password

docker push "jagcontainerregistry.azurecr.io/pycont:latest"

$regpasswd = ConvertTo-SecureString $creds.password -AsPlainText -Force

$regcreds = New-Object System.Management.Automation.PSCredential ($creds.Username, $regpasswd)

New-AzureRmContainerGroup -ResourceGroupName JazureGrave-Hub-ContainerServices -Name pythoncontainergroup -Image jagcontainerregistry.azurecr.io/pycont:latest -RegistryCredential $regcreds -cpu 1 -memory 1 -Ostype Linux -IpAddressType Public -Location 'West Europe'