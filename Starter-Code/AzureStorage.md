# Configuring Secure Access to Cloud Storage

<details open>
<summary><h5>create integration object that contains the access information</h5></summary>
<table>
<tr> 
    <th><h5>Step 1: Create a Cloud Storage Integration in Snowflake (SQL)</h5></th>
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
</pre>
</td>
</tr>
</table>
</details>

##### Step 2: Grant Snowflake Access to the Storage Locations

- Describe integration object to provide access
    - `DESC STORAGE integration` azure_integration;

# Configuring Automation With Azure Event Grid
***
<details open>
<summary><h5>create integration object that contains the access information</h5></summary>
<table>
<tr> 
    <th><h5>Step 1: Create a Cloud Storage Integration in Snowflake (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
<summary><h5>Step 3: Configuring the Event Grid Subscription</h5></summary>
* Create resurce group: `az group create --name rg-snowflake-proj --location eastus`
* Create a GPv2 account: `az storage account create --resource-group rg-snowflake-proj --name stgsnowpipetl --sku Standard_RAGRS --location eastus  --kind StorageV2`
* Create file system: `az storage fs create -n dbt-pipe-data --account-name stgsnowpipetl`
* Create a Storage Queue: `az storage queue create --name dbt-pipe-queue --account-name stgsnowpipetl`
</pre>
</td>
</tr>
</table>
</details>

<details open>
<summary><h5>create integration object that contains the access information</h5></summary>
<table>
<tr> 
    <th><h5>Step 1: Create a Cloud Storage Integration in Snowflake (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
* Storage Notification Queue: `https://stgsnowpipetl.queue.core.windows.net/dbt-pipe-queue`
* Azure active directory ID: `0736f241-6f0c-4d37-b74c-dec3495633bd`
* snowflake application name: `bksnowflakepacints`
* Primary Azure Blob Storage endpoint/url:`https://stgsnowpipetl.blob.core.windows.net/`
* Blob service Shared Access Signature:
</pre>
</td>
</tr>
</table>
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


