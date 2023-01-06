{% snapshot snap_address %}



{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = 'addressid',
    strategy = 'timestamp',
    check_cols = 'modifieddate'
    )
}}

select * 
from {{source('person','address')}}

{% endsnapshot %}