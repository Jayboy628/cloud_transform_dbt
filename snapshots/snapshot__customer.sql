{% snapshot snapshot__customer %}

{{
  config(
    target_database='ANALYTICS_DEV'
    target_schema = 'snapshots',
    unique_key = 'customerkey',
    strategy = 'timestamp',
    updated_at = 'sell_start_date'
    )
}}


select  product_id::varchar || '-' || to_char(convert_timezone('Australia/Melbourne',sysdate::timestamp),'YYYYMMDDHH24MISS') as modefdate_key,
        *
from {{ ref('dim_customer') }}

{% endsnapshot %}