{% snapshot snap_address %}



{{
  config(
    target_database='ANALYTICS'
    target_schema = 'snapshots',
    unique_key = 'addressid',
    strategy = 'check',
    check_cols = ['city','postal_code']
    )
}}

select * 
from {{source('person','address')}}

{% endsnapshot %}