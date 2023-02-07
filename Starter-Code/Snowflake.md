#  Implementing dedicated virtual warehouse

<table>
<tr> 
    <th><h5>CREATE DATA WAREHOUSE (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
`USE ROLE ACCOUNTADMIN;`
CREATE WAREHOUSE TRANSFORM_WH 
    WITH WAREHOUSE_SIZE = 'XSMALL'
    WAREHOUSE_TYPE = 'STANDARD' 
    AUTO_SUSPEND = 300 
    AUTO_RESUME = TRUE 
    MIN_CLUSTER_COUNT = 1 
    MAX_CLUSTER_COUNT = 1 
    SCALING_POLICY = 'STANDARD'
    COMMENT = 'This is Data warehouse is for world wide basicle store';
</pre>
</td>
</tr>
</table>

##### CREATE ROLE for Data Engineer (SQL)

* `CREATE ROLE` TRANSFORM_ROLE;

##### GRANT PRIV SYSADMIN (SQL)

* `GRANT MODIFY` ON WAREHOUSE TRANSFORM_WH TO ROLE ACCOUNTADMIN;

<table>
<tr> 
    <th><h5>CREATE DATA ENGINEER USER (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">

CREATE USER TRANSFORM_USER
PASSWORD = 'Rassman123' 
LOGIN_NAME = 'TRANSFORM_USER' 
DEFAULT_ROLE='TRANSFORM_ROLE' 
DEFAULT_WAREHOUSE = 'TRANSFORM_WH'  
MUST_CHANGE_PASSWORD = FALSE;

GRANT ROLE TRANSFORM_ROLE TO USER TRANSFORM_USER;
</pre>
</td>
</tr>
</table>


<details>
    <summary><h5>CREATE DATABASES (SQL)</h5> </summary>
* CREATE DATABASE `RAW;`
* CREATE DATABASE `ANALYTICS_DEV;`
* CREATE DATABASE `ANALYTICS;`
</details>

<details>
    <summary><h5>MODFIY DATABASE PRIV (SQL)</h5> </summary>

* `GRANT MODIFY ON DATABASE` RAW TO ROLE TRANSFORM_ROLE;
* `GRANT MODIFY ON DATABASE` ANALYTICS_DEV TO ROLE TRANSFORM_ROLE;
* `GRANT MODIFY ON DATABASE` ANALYTICS TO ROLE TRANSFORM_ROLE;
***
* `GRANT USAGE ON DATABASE` RAW TO ROLE TRANSFORM_ROLE;
* `GRANT USAGE ON DATABASE` ANALYTICS_DEV TO ROLE TRANSFORM_ROLE;
* `GRANT USAGE ON DATABASE` ANALYTICS TO ROLE TRANSFORM_ROLE;

</details>

<details>
    <summary><h5>GRANT PRIVALEGE ON RAW DATABASE FOR SCHEMA,TABLES AND VIEWS(SQL)</h5> </summary>

* `GRANT CREATE SCHEMA ON DATABASE` RAW TO ROLE TRANSFORM_ROLE;
* `GRANT MODIFY ON DATABASE` RAW TO ROLE TRANSFORM_ROLE;
* `GRANT MODIFY ON ALL SCHEMAS` IN DATABASE RAW TO ROLE TRANSFORM_ROLE;
***
* `GRANT USAGE ON DATABASE` RAW TO ROLE TRANSFORM_ROLE;
* `GRANT USAGE ON ALL SCHEMAS IN DATABASE` RAW TO ROLE TRANSFORM_ROLE;
***
* GRANT SELECT ON ALL TABLES IN DATABASE RAW TO ROLE TRANSFORM_ROLE;
* GRANT SELECT ON ALL VIEWS IN DATABASE RAW TO ROLE TRANSFORM_ROLE;

</details>


<details>
    <summary><h5>CREATE SCHEMA (SQL)</h5> </summary>
* CREATE SCHEMA `RAW.HumanResources;`
* CREATE SCHEMA `RAW.Person;`
* CREATE SCHEMA `RAW.Production;`
* CREATE SCHEMA `RAW.Sales;`
</details>


<details>
    <summary><h5>CREATE TABLE (SQL)</h5> </summary>
<table>
<tr> 
    <th><h5>CREATE TABLE Production.Product (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
CREATE TABLE Production.Product(
ProductID int IDENTITY(1,1) NOT NULL,
Name dbo.Name NOT NULL,
ProductNumber nvarchar(25) NOT NULL,
MakeFlag dbo.Flag NOT NULL,
FinishedGoodsFlag dbo.Flag NOT NULL,
Color nvarchar(15) NULL,
SafetyStockLevel smallint NOT NULL,
ReorderPoint smallint NOT NULL,
StandardCost money NOT NULL,
ListPrice money NOT NULL,
Size nvarchar(5) NULL,
SizeUnitMeasureCode nchar(3) NULL,
WeightUnitMeasureCode nchar(3) NULL,
Weight decimal(8, 2) NULL,
DaysToManufacture int NOT NULL,
ProductLine nchar(2) NULL,
Class nchar(2) NULL,
Style nchar(2) NULL,
ProductSubcategoryID int NULL,
ProductModelID int NULL,
SellStartDate datetime NOT NULL,
SellEndDate datetime NULL,
DiscontinuedDate datetime NULL,
ModifiedDate datetime NOT NULL)
</pre>
</td>
</tr>
</table>

<table>
<tr> 
    <th><h5>CREATE TABLE Sales.Customer (SQL)</h5></th>
</tr>
<tr>
<td>  
<pre lang="js">
CREATE TABLE Sales.Customer(
CustomerID int IDENTITY(1,1)NOT NULL,
PersonID int NULL,
StoreID int NULL,
TerritoryID int NULL,
ModifiedDate datetime NOT NULL
</pre>
</td>
</tr>
</table>
</details>

