# Configuring Secure Access to Cloud Storage

#### Step 1: Create a Cloud Storage Integration in Snowflake
<details open>
<table>
<tr> 
    <th><h5>create integration object that contains the access information (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
USE DATABASE RAW;

CREATE STORAGE INTEGRATION azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = '0736f241-6f0c-4d37-b74c-dec3495633bd'
  STORAGE_ALLOWED_LOCATIONS = ('azure://stgproject.blob.core.windows.net/dbt-lt-data');
</details>
</pre>
</td>
</tr>
</table>
</details>

##### Step 2: Grant Snowflake Access to the Storage Locations

- Describe integration object to provide access
    - DESC STORAGE integration azure_integration;

# Configuring Automation With Azure Event Grid

##### Step 1: Configuring the Event Grid Subscription

<bold> Create resurce group</bold>
    - az group create --name rg-snowflake-proj --location eastus

<bold> Create a GPv2 account</bold>
    - az storage account create --resource-group rg-snowflake-proj --name stgsnowpipetl --sku Standard_RAGRS --location eastus  --kind StorageV2

<bold> Create file system</bold>
    - az storage fs create -n dbt-pipe-data --account-name stgsnowpipetl

<bold> Create a Storage Queue</bold>
    - az storage queue create --name dbt-pipe-queue --account-name stgsnowpipetl 

<details open>
<summary><h5>create integration object that contains the access information</h5></summary>

* Storage Notification Queue: `https://stgsnowpipetl.queue.core.windows.net/dbt-pipe-queue`
* Azure active directory ID: `0736f241-6f0c-4d37-b74c-dec3495633bd`
* snowflake application name: `bksnowflakepacints`
* Primary Azure Blob Storage endpoint/url:`https://stgsnowpipetl.blob.core.windows.net/`
* Blob service Shared Access Signature:
</details>
***

topicname="snowpipe"
az eventgrid topic create --name $topicname -l eastus -g rg-snow-project

storagename="stgsnowpipetl"

queuename="dbt-pipe-queue"

az storage account create -n $storagename -g rg-snow-project -l eastus --sku Standard_LRS
key="$(az storage account keys list -n $storagename --query "[0].{value:value}" --output tsv)"    
az storage queue create --name $queuename --account-name $storagename --account-key $key


storageid=$(az storage account show --name $storagename --resource-group rg-snowflake-proj --query id --output tsv)
queueid="$storageid/queueservices/default/queues/$queuename"
topicid=$(az eventgrid topic show --name $topicname -g rg-snowflake-proj --query id --output tsv)

az eventgrid event-subscription create \
  --source-resource-id $topicid \
  --name mystoragequeuesubscription \
  --endpoint-type storagequeue \
  --endpoint $queueid \
  --expiration-date "2023-02-05"

endpoint=$(az eventgrid topic show --name $topicname -g rg-snow-project --query "endpoint" --output tsv)
key=$(az eventgrid topic key list --name $topicname -g rg-snow-project --query "key1" --output tsv)


