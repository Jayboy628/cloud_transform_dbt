
{{ config(
    materialized = 'incremental',
    unique_key = 'PRODUCTID'
) }}

with product as (

	 select * from {{ source('production','product')}}

    {% if is_incremental() %}
    where MODIFIEDDATE >= (select max(MODIFIEDDATE) from {{ this }})
    {% endif %}
),

final as 

(

select
	PRODUCTID as product_id,
	NAME as name,
	PRODUCTNUMBER as product_number,
	MAKEFLAG as make_flag,
	FINISHEDGOODSFLAG as finished_goods_flag,
	COLOR as color,
	SAFETYSTOCKLEVEL as safety_stock_level,
	REORDERPOINT as reorder_point,
	STANDARDCOST as standard_cost,
	LISTPRICE as list_price,
	SIZE as size,
	SIZEUNITMEASURECODE as size_unit_measure_code,
	WEIGHTUNITMEASURECODE as weight_unit_measure_code,
	WEIGHT as weight,
	DAYSTOMANUFACTURE as days_to_manufacture,
	PRODUCTLINE as product_line,
	CLASS as class,
	STYLE as style,
	PRODUCTSUBCATEGORYID as product_subcategory_id,
	PRODUCTMODELID as product_model_id,
	SELLSTARTDATE as sell_start_date,
	SELLENDDATE as sell_end_date,
	DISCONTINUEDDATE discontinued_date,
	MODIFIEDDATE as modified_date
	
from product

)

select * from final