
<!-- ABOUT THE PROJECT -->
# ETL with DBT:  `Data Transform`

`Data Warehouse:`AWS bicycle company has many locations in various parts of the world. However, their Transactional System data is stored locally, and as a result is not cross integrated. Another issue is that the CRM is not coordinated with online purchases. As a result, faulty reports are generated. The following are some of the questions asked by `users`

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
 ```I have used SSIS extensively and more recently began using dbt. Once the user is able to overcome the steep learning curve, I have found SSIS to be a far more robust tool . Fortunately dbt has no drag and drop, right click properties, configure this, configure that, etc etc. It's all code (models). More important dbt works damn well with Snowflake (Snowflake does more of the heavy lifting) so I have no complaints… Management doesn't really care how complex your code is (industry dependent), they just need that report yesterday and dbt gets the job done quickly!```
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

#### Installation Requriments

* Install [Visual Studio](https://code.visualstudio.com/docs/python/python-tutorial) Code editor, Extension Python and [GIT](https://code.visualstudio.com/docs/sourcecontrol/overview)
* Create accounts for [Snowflake](https://github.com/Snowflake-Labs/sfquickstarts) and new repository on [Github](https://docs.github.com/en/get-started/onboarding/getting-started-with-your-github-account)
* Setup a Snowflake Environment
* Download & Installled dbt CLI
* Initialized a new dbt project
    
#### Azure: Create Storage  ```Setup a Snowflake Environment```
* [`AzureStorage.md`](Starter-Code/AzureStorage.md) -- Step 1  CLI Code.

#### Snowflake: Create Data Warehouse ```Setup a Snowflake Environment```
* [`Snowflake.md`](Starter-Code/Snowflake.md) -- Step 2 SQL Code.

    
#### Integrate: Create stage integration for azure and snowflake  ```Setup a Snowflake Environment``` 
* [`Integration.md`](Starter-Code/Integration.md) -- Step 3 SQL Code.

    
#### Data Load: Load CSV and JSON files  ```Setup a Snowflake Environment```
* [`Load.md`](Starter-Code/Load.md) -- Step 4  SQL Code.


#### GITHUB 
<bold>Recommend to use the Visual Studio Terminal to following below steps</bold>

* Check python version: Python >= 3.5  `python -V`
* Create working Environment: `python3 -m venv venv`
* Change to working environment `source venv/bin/activate`
* Clone github repisprty in terminal: `git clone https://github.com/Jayboy628/cloud-snowflake-dbt.git`
* Change to the clone directory: `cd cloud-snowflake-dbt`
* Upgrade pip   `python3 -m pip install --upgrade pip`
* Download & Installled dbt CLI: `pip install dbt-snowflake`
* Initialized a new dbt project: `dbt init dbt_project`

![header](images/Setupenv.png)

* Then run `dbt debug`
![header](images/debugconnection.png)

</details>

<!-- GETTING STARTED -->
## We're all set up... Demo Time! 
***
![header](images/WhatsPlan.png)
* `Transform` raw source data into structure data models on `Snowflake` using `dbt`.
* Save a `version-controlled` project on `GitHub`
* Modelling `SCD1` and `SCD2` Dimensions with dbt
* Model Star Schema: `Facts` and `Dimension`
* Automate `Testing` and `Deploying` using GitHub Actions
* Create a schedule for running dbt models using a `Cron job`
***
### Diagram Shows our CI/CD & Scheduling`Cron job` Approach
![header](images/GithubFeatures.png)

