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


select      *
from {{ ref('dim_customer') }}

{% endsnapshot %}