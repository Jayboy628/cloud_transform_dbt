{% snapshot snap__product %}

{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = 'productid',
    strategy = 'check',
    check_cols = ['PRODUCTID','PRODUCTMODELID','PRODUCTSUBCATEGORYID','NAME']

    )
}}

{%- set t1_cols = [ 'STANDARDCOST','LISTPRICE','MODIFIEDDATE' ] -%}

select 
productid::varchar || '-' || to_char(convert_timezone( 'America/New_York',current_timestamp::timestamp),'YYYYMMDDHH24MISS') as PRODUCT_KEY,
*,
        {{ dbt_utils.generate_surrogate_key(t1_cols) }} as t1_key
       
 from {{ source('production','product')}}

{% endsnapshot %}
