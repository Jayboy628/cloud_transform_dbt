{% snapshot snapshot_customer %}

{{
  config(
    target_database='ANALYTICS_DEV'
    target_schema = 'warehouse',
    unique_key = 'customerkey',
    strategy = 'check',
    check_cols = ['city','state_province_code', 'stateprovince', 'country_region_code', 'country', 'postal_code']
    )
}}

select * from {{ref('warehouse','dim_customer')}}

{% endsnapshot %}