





#### Create Integration Object that contains the access information
`USE DATABASE RAW;

CREATE STORAGE INTEGRATION azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = '0732f221-6f0c-41d3-b74c-dtc3486513bd'
  STORAGE_ALLOWED_LOCATIONS = ('azure://stgdbtproj.blob.core.windows.net/dbt-elt-data');`

#### Describe integration object to provide access
    * DESC STORAGE integration azure_integration;