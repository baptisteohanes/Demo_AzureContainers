# Simple CONTAINERIZED python application

Prerequisites on the Build environment:
- Install Docker
- That's all, no Python or Azure SDK :)

Prerequisites on the potential RUN environment:
- Install Docker
- That's all, no Python or Azure SDK :)

Reuse the storage account from the example 1

Gather the following details again :
- Storage account name
- Storage account BLOB Container name
- Storage account primary access key

Update the environement variables in the Dockerfile

Run the PowerShell script to build the image and run it. Check the storage accoun to see the json file appear regularly.

# Conclusion

To do simple data prep, this time, after you've built the image, you just need to have Docker installed on the target Run machine since the dependencies will be embedded in the container.