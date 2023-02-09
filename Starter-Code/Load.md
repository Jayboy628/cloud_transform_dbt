
# Load JSON Files

`
--- Load JSON ---- 
<table>
<tr> 
    <th><h5>CREATE Integration (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">

USE DATABASE ADVENT19_DEV;

create or replace file format ADVENT19_DEV.production.fileformat_azure_json
    TYPE = JSON;
    
create or replace stage ADVENT19_DEV.production.stage_azure
    STORAGE_INTEGRATION = azure_integration
    URL = 'azure://stgproject.blob.core.windows.net/dbt-elt-data/ProductionProductModel.json'
    //azure://stgproject.blob.core.windows.net/dbt-elt-data/ProductionProductModel.json
    FILE_FORMAT = fileformat_azure_json; 

</pre>
</td>
</tr>
</table>

<table>
<tr> 
    <th><h5>Query from azure container (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
LIST  @ADVENT19_DEV.production.stage_azure;
    
-- Query from stage  
SELECT * FROM @ADVENT19_DEV.production.stage_azure;  

-- Query one attribute/column
SELECT $1:"ProductModelID" FROM @ADVENT19_DEV.production.stage_azure;

</pre>
</td>
</tr>
</table>
<table>
<tr> 
    <th><h5>Convert data type  (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
 
SELECT $1:"ModifiedDate"::DATETIME FROM @ADVENT19_DEV.production.stage_azure; 

{   "ModifiedDate": "2013-04-30T00:00:00",   "Name": "Classic Vest",   "ProductModelID": 1,   "rowguid": "29321d47-1e4c-4aac-887c-19634328c25e" }
-- Query all attributes  
SELECT 
$1:"ProductModelID"::INT, 
$1:"Name"::STRING,
$1:"rowguid"::STRING, 
$1:"ModifiedDate"::DATETIME
FROM @ADVENT19_DEV.production.stage_azure; 
</pre>
</td>
</tr>
</table>

 
<table>
<tr> 
    <th><h5>Query all attributes and use aliases  (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
SELECT 
$1:"ProductModelID"::INT AS ProductModelID, 
$1:"Name"::STRING AS Name,
$1:"rowguid"::STRING AS rowguid, 
$1:"ModifiedDate"::DATETIME AS ModifiedDate
FROM @ADVENT19_DEV.production.stage_azure;     
</pre>
</td>
</tr>
</table>

<table>
<tr> 
    <th><h5>Load Data into Snowflake table  (SQL:JSON)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">

Create or replace table Product_Model (
    ProductModelID INT, 
    Name varchar,
    rowguid varchar, 
    ModifiedDate datetime)
 
COPY INTO Product_Model
FROM
(SELECT 
$1:"ProductModelID"::INT AS ProductModelID, 
$1:"Name"::STRING AS Name,
$1:"rowguid"::STRING AS rowguid, 
$1:"ModifiedDate"::DATETIME AS ModifiedDate
FROM @ADVENT19_DEV.production.stage_azure
);

SELECT top 10 * FROM Product_Model;`
</pre>
</td>
</tr>
</table>










