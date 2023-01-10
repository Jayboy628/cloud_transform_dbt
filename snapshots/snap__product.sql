{% snapshot snap__product %}

{{
  config(
    target_schema = 'snapshots',
    unique_key = 'productid',
    strategy = 'check',
    updated_at = 'modifieddate'
   
    )
}}

{%- set t1_cols = ['PRODUCTID','PRODUCTNAME','PRODUCTMODELID','MODELNAME','PRODUCTSUBCATEGORYID'] -%}

select 
        {{ dbt_utils.surrogate_key(t1_cols) }} as PRODUCT_KEY, *
 from {{ source('production','product')}}

{% endsnapshot %}