{% snapshot snap__address %}



{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = 'addressid',
    strategy = 'timestamp',
    updated_at = 'modifieddate'
    )
}}

select * 
from {{source('person','address')}}

{% endsnapshot %}