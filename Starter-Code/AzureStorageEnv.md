# Configure Databricks CLI
confirm if databricks is installed
- databricks -v
### We get the following info before we start to configure
- host: this located in the databrick url
- Token : Login Azure then Databricks and in the databricks env -> go to the user settings 
    - Generate new token
#### Configure databricks note: (name your profile or azure will choose a name)
----------------run command
- databricks configure --token --profile profile hvfs
    - HOST -> https://adb-3225559356119888.8.azuredatabricks.net/ -> https://adb-7509652571975560.0.azuredatabricks.net/
    - comment -> projects for databrick ->New York City Car Service
    - Token -> dapiace92361164e948bd1fe4087fb268610-3 -> dapi8cb7cd08e7e4ce3a1725bb5100f0da93-3
- databricks fs ls --profile hvfs 
    - databricks-results
### AD Details
#### On the Azure platform search for:
- Azure Active Directory -> App registrations
    - Certificates & Secrets -> New Client Secrets Create secreate key - Add a Client secret
        - - Client Secret Value: zyT8Q~PNAgRcgr4PatMmRV73V~zw1T15Ic4aZc~T
        - - Client Scret ID: 999ef19b-7432-4101-bda9-ee35db85086f
- Register an application 
- - Application (client) ID 34bd7d41-9825-42d8-8af1-410b5fbe7d75
- - Object ID 212ab39c-68d8-4083-87fc-bdf25cbb406d
- - Directory (tenant) ID 0732f221-6f0c-41d3-b74c-dec3485513bd

- Azure Active Directory -> App registrations
    - Certificates & Secrets -> New Client Secrets Create secreate key - Add a Client secret
        - - Client Secret Value: F~t8Q~PoIODXm2lq63hRiLJftT9YvMH6c3m13a7r
        - - Client Scret ID: ad14c30e-5ac3-43c9-b8fa-c53d6faa2bde
    - Register an application 
        - - Application (client) ID 90a0bb4b-35b7-44dc-bc36-32f17860a531
        - - Object ID 8753a139-3914-4db2-a1ff-1bb31099f994
        - - Directory (tenant) ID 0732f221-6f0c-41d3-b74c-dec3485513bd
### Create Databricks Secret for AD Application Client Secret

1) Create scope -> databricks secrets create-scope --scope  projectdbscope --profile projectslsdb  

2) Then we update the client secret value commands below
    - databricks secrets put --scope projectdbscope --key projectdbkey --profile projectslsdb

1) Create scope -> databricks secrets create-scope --scope  projectdbscope --profile projectslsdb 
    - databricks secrets create-scope --scope fhvsproject --profile hvfs --initial-manage-principal "users" 

2) Then we update the client secret value commands below
    - databricks secrets put --scope fhvsproject --key fhvkey --profile hvfs
        - Then get the client secret value and paste - Client Secret Value: zyT8Q~PNAgRcgr4PatMmRV73V~zw1T15Ic4aZc~T

### Create Secret Scope to store

1) Click Key Vault -> Create key vault : follow steps
2) click on fhv-key-vault -> Secrets -> Generate/import
    - Create three secrets
        - databricks-app-client-secret
        - databricks-app-tenant-id
        - databricks-app-client-id
3) Creating Secret Scope vault
    - In the databrick env -> click the home tab
    - Then in the Url add to the existing URL:
        - secrets/createScope
    - New page up
        - Name: fhv-scope
        - Manage Principal: Creator
        - DNS Name
            - Go back to the key vault created (fhv-key-vault) -> Properties
                - Vault URI copy -> paste for  DNS
                - Resource ID copy -> paste for resource id
         
### Create ADLS Storage Account CLI
#### List of resource group
> --az group list --query '[*].name'
#### List of storage account
> --az storage account list --query '[*].name'
#### Create Storage Group (name is projectstg)
 az storage account create -n projectstg -g project_databricksrg -l eastus --sku Standard_LRS
 
 az storage account create -n stgbricksproj -g rg-databricks-proj -l eastus --sku Standard_LRS
#### List of storage account using the resouce Group
az storage account list --query '[*].name' -g project_databricksrg

### Assign IAM ROLE on Storage Account to Azure AD

1) Go to storage account or search for it and click on it
2) Go to access ccontrol (IAM)
3) Click on Add Role Assignment and search for Storage Blob Contributor
4) Select members and search for the application that was created

### Create ADLS Container or File System and Upload Data using CLU
1) Search for a list of storage account - example below
    - az storage account list --query '[*].name'
2) Search for the select storage account reference the Resource Group - example below
    - az storage account list --query '[*].name' -g project_databricksrg
        [
          "projectstg"
        ]
3) Create the file system or container by 
    a. Name the Container and Assign the appropriate Storage Account - example below
     - az storage fs create -n projectdata --account-name projectstg
    b. list the file system(container)by refering the storage account
    - az storage fs list --account-name projectstg
4) Upload the file to the container or file system
    - az storage fs directory upload -f projectdata --account-name projectstg -s "/Users/shaunjaybrown/projects/repo/retail_db" --recursive
5) Confirm the folders were loaded
   - az storage fs directory list -f projectdata --account-name  projectstg
6) Confirm the files were loade
   - az storage fs file list -f projectdata --account-name  projectstg