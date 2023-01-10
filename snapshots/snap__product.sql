{% snapshot snap__product %}

{{
  config(
    target_database='ANALYTICS',
    target_schema = 'snapshots',
    unique_key = 'productid',
    strategy = 'timestamp',
    updated_at = 'modifieddate'
   
    )
}}

{%- set t1_cols = ['PRODUCTID','PRODUCTNAME','PRODUCTMODELID','MODELNAME','PRODUCTSUBCATEGORYID'] -%}

select 
        {{ dbt_utils.generate_surrogate_key(t1_cols) }} as PRODUCT_KEY, *
 from {{ source('production','product')}}

{% endsnapshot %}
