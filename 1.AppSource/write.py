from datetime import datetime
import time
import os
from azure.storage.blob import BlockBlobService
from azure.storage.blob import ContentSettings

storageaccountname = "jagcontainerstore"
storageaccountkey = "<StorageAccountKey"
storagecontainername = "store"

block_blob_service = BlockBlobService(account_name=storageaccountname, account_key=storageaccountkey)
n=1
while True:
    filename = "file" + str(n) + ".json"
    filecontent = datetime.now()
    block_blob_service.create_blob_from_text(
        storagecontainername,
        filename,
        str(filecontent),
        content_settings=ContentSettings(content_type='application/json')
    )
    message = filename + " written at " + str(datetime.now())
    print(message)
    n += 1
    time.sleep(5)