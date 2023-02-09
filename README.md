
<!-- ABOUT THE PROJECT -->
# ETL with DBT:  `Data Transform`

`Data Warehouse:`AWS bicycle company has many locations in various parts of the world. However, their Transactional System (CRM Database) data are stored locally but more importantly the systems are not cross integrated. Another issue is that the CRM is not coordinated with online purchase thus led to following questions below

![header](images/logo.png)

<details open>
<summary>
    
#### Questions: Business Intelligence
    
</summary>
        
- How can we see FASTER what is happening now? 
- How is business changing over time? 
- How can we analyze the data more effectively? 
- How can we discover what is driving the positive trends? 
- How can we stop or reverse negative trends? 
 
</details>   

<details open>
<summary>
    
#### Reasons: Business Intelligence 
</summary>
    
- No consistency in pulling data from transaction system 
- Difficulty making comparisons and spotting trends over time  
- Unable to respond quickly to sales trends or to changing customer behaviors 
- No Single Source of Truth (SSOT)

</details>  

<details open>
<summary>

 ### The dbt Viewpoint: Our Approach gets the job done quickly!
 ![header](images/BriefHistory.png)
 <bold>
 ```I have used SSIS extensively and recently dive into DBT and from my experience SSIS is a far more robust tool. However, There's no drag and drop, right click properties, configure this, configure that, etc etc in dbt. It's all code (models). More importantly dbt works damn well with Snowflake (Snowflake carries heavy lifting and cost) so I have no complaints… Management doesn't really care how complex (Truly depends on the industry) your code is, they just need that report yesterday and dbt gets the job done quickly!```
</bold>
</summary>    
<table>
<tr> 
    <th><h4>Analytics is collaborative</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
    *  Version Control: Code evolves and you should always know what changed, when.
    *  Quality Assurance: Any code that generates code for analysis should be reviewed and tested.
    *  Documentation: Package your code with descriptions for how it should be interpreted.
    *  Modularity: Create data sets that are consistent and can be easily updated as logic changes.
</pre>
</td>
</tr>
</table>

<table>
<tr> 
    <th><h4>Analytics code is an asset</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
    *  Environments: Analytics requires multiple environments.
    *  Service Level Guarantees: Errors should be treated with the same urgency as bugs in production software.
    *  Design for Maintainability: Most of the cost in development is in the maintenance phase.
</pre>
</td>
</tr>
</table>


<table>
<tr> 
    <th><h4>Analytics requires automated tools</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
    *  Reduce manual workflow steps: Reallocate time to more value-add engineering tasks.
    *  Run with a singe command: All steps should be warpped together and easily executed in order.
</pre>
</td>
</tr>
</table>
</details>   

***

## Step-by-Step Explanation To Run This Project
***

<details open>
<summary>Project Environment </summary>

#### Installation requriments

* Install Visual Studio Code editor, Extension Python and GIT
* Create accounts on Github and Snowflake
* Create a new repository on GitHub and Snowflake
* Setup a Snowflake Environment
* Download & Installled dbt CLI
* Initialized a new dbt project
    
#### Azure: Create Storage (Setup a Snowflake Environment)
    
* [`AzureStorage.md`](Starter-Code/AzureStorage.md) -- Step 1  CLI Code.

#### Snowflake: Create Data Warehouse (Setup a Snowflake Environment)

* [`Snowflake.md`](Starter-Code/Snowflake.md) -- Step 2 SQL Code.

    
#### Integrate: Create stage integration for azure and snowflake (Setup a Snowflake Environment)
    
* [`Integration.md`](Starter-Code/Integration.sql) -- Step 3 SQL Code.

    
#### Data Load: Load CSV and JSON files  (Setup a Snowflake Environment)
* [`Load.md`](Starter-Code/Load.sql) -- Step 4  SQL Code.


#### GITHUB 
<bold>Recommend to use the Visual Studio Terminal to following below steps</bold>
```shell
- Check python version: Python >= 3.5
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
dbt docs serve_
```

</details>

<!-- GETTING STARTED -->
## We're all set up... What's the plan? 
***
![header](images/WhatsPlan.png)
* `Transform` raw source data into structure data models on `Snowflake` using `dbt`.
* Save a `version-controlled` project on `GitHub`
* Modelling `SCD1` and `SCD2` Dimensions with dbt
* Model Star Schema: `Facts` and `Dimension`
* Automate `Testing` and `Deploying` using GitHub Actions
* Create a schedule for running dbt models using a `Cron job`

