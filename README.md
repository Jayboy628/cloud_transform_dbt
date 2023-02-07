
<!-- ABOUT THE PROJECT -->
# ETL with DBT:  `Data Transform`

`Data Warehouse:`AWS bicycle company has many locations in various parts of the world. However, their Transactional System (CRM Database) data are stored locally but more importantly the systems are not cross integrated. Another issue is that the CRM is not coordinated with online purchase thus led to following questions below

![header](images/logo.png)

<details>
<summary>
    
## Questions: Business Intelligence
    
</summary>
        
- How can we see FASTER what is happening now? 
- How is business changing over time? 
- How can we analyze the data more effectively? 
- How can we discover what is driving the positive trends? 
- How can we stop or reverse negative trends? 
 
</details>   

<details>
<summary>
    
## Reasons: Business Intelligence 
</summary>
    
- No consistency in pulling data from transaction system 
- Difficulty making comparisons and spotting trends over time  
- Unable to respond quickly to sales trends or to changing customer behaviors 
- No Single Source of Truth (SSOT)

</details>  

<details>
<summary>

 ## High Level Solution: Data Architecture
</summary>    

- Design and develop data warehouse to support sales and marketing 
- Benefits include consistent reporting available on-demand quickly 
- Infrastructure will expand in the future to support more subject areas 
- Manage and Document business processes 
</details>   

***
<!-- GETTING STARTED -->
## What DBT can do: 


2) Facts, Dimension
3) Version Control
1) DBT can model SCD1 and SCD2




## Running this project
***
#### Step-by-step explanation
<details>
<summary>Create Snowflake and Storage Environment </summary>

#### Azure: Create Storage using CLI 

* [`Snowflake.md`](Starter-Code/Snowflake.md) -- Step 1 CLI Code.
    
#### Snowflake: Create Data warehosue
    
* [`AzureStorage.md`](Starter-Code/AzureStorage.md) -- Step 2  SQL Code.
    
#### Integrate: Create stage integration for azure and snowflake 
    
* [`Snowflake.md`](Starter-Code/Snowflake.sql) -- Step 3 SQL Code.
    
#### Data Load: Load CSV and JSON files    
* [`Snowflake.md`](Starter-Code/Snowflake.sql) -- Step 4  SQL Code.

</details>
> Run `dbt` as fast as possible in a single copy and paste motion!

<details open>
<summary>GitHub Codespaces / Dev Containers</summary>

```shell
Prerequisities: Python >= 3.5
git clone https://github.com/Jayboy628/cloud-snowflake-dbt.git
cd cloud-snowflake-dbt
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
pip install dbt-snowflake
python3 -m pip install -r requirements.txt
source venv/bin/activate
dbt build
dbt docs generate
dbt docs serve
```
</details>

