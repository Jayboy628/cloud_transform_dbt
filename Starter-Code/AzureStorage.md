
# Create ADLS Storage Account CLI
***

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