# Custom events to Azure Queue storage via Event Grid using Azure CLI

***
<details open>
<summary><h5>Step 2: Configuring Automation With Azure Event Grid</h5></summary>
<table>
<tr> 
    <th><h5>Setup Event Grid (CLI)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
* Create resurce group: `az group create --name rg-snowflake-proj --location eastus`
* Enable the Event Grid resource provider: az provider register --namespace Microsoft.EventGrid
* Create a GPv2 account: `az storage account create --resource-group rg-snowflake-proj --name stgsnowpipetl --sku Standard_RAGRS --location eastus  --kind StorageV2`
* Create file system: `az storage fs create -n dbt-pipe-data --account-name stgsnowpipetl`
* Create a Storage Queue: `az storage queue create --name dbt-pipe-queue --account-name stgsnowpipetl`
</pre>
</td>
</tr>
</table>
</details>

<table>
<tr> 
    <th><h5>Create a custom topic</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
    - topicname="snowpipe"
        - az eventgrid topic create --name $topicname -l eastus -g rg-snow-project
</pre>
</td>
</tr>
</table>
</details>
  
***
<table>
<tr> 
    <th><h5>Create Queue storage</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
- storagename="stgsnowpipetl"
- queuename="dbt-pipe-queue"
* az storage account create -n $storagename -g rg-snow-project -l eastus --sku Standard_LRS
* key="$(az storage account keys list -n $storagename --query "[0].{value:value}" --output tsv)"    
* az storage queue create --name $queuename --account-name $storagename --account-key $key
</pre>
</td>
</tr>
</table>
</details>
***

<table>
<tr> 
    <th><h5>Subscribe to a custom topic</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">

* storageid=$(az storage account show --name $storagename --resource-group rg-snowflake-proj --query id --output tsv)
* queueid="$storageid/queueservices/default/queues/$queuename"
* topicid=$(az eventgrid topic show --name $topicname -g rg-snowflake-proj --query id --output tsv)

`az eventgrid event-subscription create \
  --source-resource-id $topicid \
  --name mystoragequeuesubscription \
  --endpoint-type storagequeue \
  --endpoint $queueid \
  --expiration-date "2023-02-05"`
</pre>
</td>
</tr>
</table>
</details>

##### Send an event to your custom topic
    - endpoint=$(az eventgrid topic show --name $topicname -g rg-snow-project --query "endpoint" --output tsv)
    - key=$(az eventgrid topic key list --name $topicname -g rg-snow-project --query "key1" --output tsv)

