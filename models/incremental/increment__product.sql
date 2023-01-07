
{{ config(
    materialized = 'incremental'
) }}

with product as (
	 select * from {{ref('stg_production__product')}}
    {% if is_incremental() %}
    where modified_date >= (select max(modified_date) from {{ this }})
    {% endif %}
)

select * from product