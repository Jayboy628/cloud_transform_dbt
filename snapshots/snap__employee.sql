{% snapshot snap__employee %}



{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = "BUSINESSENTITYID",
    strategy = 'timestamp',
    updated_at = 'modifieddate'
    )
}}


select 
            JobTitle as job_title,
            HireDate as hire_date
from {{ source('humanresources','employee') }}

{% endsnapshot %}