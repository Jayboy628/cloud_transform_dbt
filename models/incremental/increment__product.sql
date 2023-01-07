
{{ config(
    materialized = 'incremental'
) }}

with product as (

	 select * from {{ref('stg_production__product')}}

    {% if is_incremental() %}
    where MODIFIED_DATE >= (select max(MODIFIED_DATE) from {{ this }})
    {% endif %}
),

select * from product