# Simple CONTAINERIZED python application

Now the goal is to run our container in a Azure Container Instance.

Prerequistes:

- Do the #2 exercise first, the build phase will go faster since the image layers will be cached locally. 
- Create an Azure Container Registry in your subscription and gather the following details :
    - the container registry shortname
    - the resource group in which it was deployed
- Reuse the settings you used from the storage account and update the dockerfile environment variables (yes, it's an HERESY ;) , you SHOULD do that at deployment time thourgh the PS comdlet or configure the application to fetch the secret from an Azure Key Vault)
    - Storage account name
    - Storage account BLOB Container name
    - Storage account primary access key

Run the PS script to build an deploy in Azure your container. Enjoy !

# Conclusion

To do simple data prep, this time, after you've built the image, deploy the image to Azure Container Instance. ACI are very good target for transient containrized jobs, since you'll pay for the seconds of run only and no more.