## Importing bootc images to Azure Cloud
These are the steps taken to import an existing bootc image to use it in an Azure Cloud virtual machine.  
  
We need an existing bootc RAW image. In our case we got the RAW image from a bootc container and then  
using bootc-image-builder to get the image to be converted.  

Also we need these previously created resources in Azure:  

Resource group  
Storage account  
Storage container  

Our Storage account should have some specific roles so we can upload images:  
Go to Storage account > IAM > Add role assignment.  
In 'Add Role Assignment', select these two roles  
Storage Blob Data Contributor  
Storage Queue Data Contributor  
Assign them to your account.  

Once we have the needed resources we should:  
 
Convert the RAW image to a fixed VHD image  
Upload the VHD image to our Azure Storage Container  
Create a disk from VHD image  
Create a virtual machine from the new disk  

### Files in this repo:  
`Containerfile` to build a new local container image from a given bootc container adding Azure agent configuration.

`setup-azure-img.sh` includes some specific cloud packages, Azure agent and basic config.

`bootc-image-builder` converts the container image in a RAW bootc disk image.

`config.toml` used by boot-image-builder as a custom config file for injecting a hardcoded user/group/ssh public key

`azure-convert.sh` takes the RAW image converts it to VHD, uploads it, creates a disk file and fires up a vm using it.



