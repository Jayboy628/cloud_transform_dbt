{% snapshot snapshot_customer %}

{% set new_schema = target.schema + '_snapshot' %}


{{
  config(
    target_database='ANALYTICS_DEV'
    target_schema = new_schema,
    unique_key = 'customerkey',
    strategy = 'check',
    check_cols = ['city','state_province_code', 'stateprovince', 'country_region_code', 'country', 'postal_code']
    )
}}

select * from {{ref('dim_customer')}}

{% endsnapshot %}