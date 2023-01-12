-- product table
with product as 

(
    select * from {{ref('stg_production__product')}}
),

product_model as 

(
    select * from {{ref('stg_production__product_model')}}
),

product_subcategory as 

(
    select * from {{ref('dim_production__product_subcategory')}}
),

final as 

(

select
    md5(product_id) as product_key,
    product_id,
    p.name as product_name,
    p.product_model_id,
    pm.Name as model_name,
    p.product_subcategory_id,
    color,
    case when Class = 'H' then 'High' when Class = 'M' then 'Medium' when Class = 'L' then 'Low'
    when Class is null then 'No class'end as Class,
    case when Style = 'M' then 'Men' when Style = 'W' then 'Women' when Style = 'U' then 'Unisex'
    when Style is null then 'No style'end as style,
    case when size_unit_measure_code is null then 'N/A' else size_unit_measure_code end as size_unit_measure_code,
    standard_cost,
    case when list_price < standard_cost then standard_cost else list_price end as list_price,
    p.modified_date,
    case when discontinued_date is not null then 'Discontinued' else 'Current' end as product_current_status
from product p
        left outer join product_model pm on p.product_model_id = pm.product_model_id
        left outer join product_subcategory psc on psc.product_subcategory_id = p.product_subcategory_id

)

select * from final



