#!/bin/bash
set -x
LOCAL_RAW_IMG=azure-disk.raw
VHD_IMAGE=bootc.vhd
AZ_RESOURCE_GROUP=bootc-tests
AZ_STORAGE_ACCOUNT=ebelarte
AZ_CONTAINERNAME=myimagescontainer
AZ_DISKNAME=DiskBootc
AZ_VMNAME=mybootcvm
qemu-img convert -f raw -O vpc -o subformat=fixed,force_size $LOCAL_RAW_IMG $VHD_IMAGE
#azcopy_linux_amd64 login needs to be run before copy command
azcopy_linux_amd64 copy $VHD_IMAGE "https://$AZ_STORAGE_ACCOUNT.blob.core.windows.net/$AZ_CONTAINERNAME/$VHD_IMAGE"
az disk create --resource-group $AZ_RESOURCE_GROUP --name $AZ_DISKNAME --source https://$AZ_STORAGE_ACCOUNT.blob.core.windows.net/$AZ_CONTAINERNAME/$VHD_IMAGE
az vm create --resource-group $AZ_RESOURCE_GROUP --name $AZ_VMNAME --attach-os-disk $AZ_DISKNAME --os-type Linux
#az vm user update --username cloud-user -n my-nvidia-bootc -g bootc-tests --ssh-key-value /root/.ssh/id_rsa.pub
