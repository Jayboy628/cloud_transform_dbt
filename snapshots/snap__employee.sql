% snapshot snap__employee %}



{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = 'BusinessEntityID',
    strategy = 'timestamp',
    updated_at = 'modifieddate'
    )
}}

select 
            BusinessEntityID as business_entity_id,
            JobTitle as job_title,
            HireDate as hire_date,
from {{ source('humanresources','employee') }}

{% endsnapshot %}