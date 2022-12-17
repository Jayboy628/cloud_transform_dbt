
with production__product_category as 
(
    select * from {{ref('stg_production__product_category')}}
),

final as 
(

    SELECT 
   md5(product_category_id)as product_category_key,
    product_category_id, 
    product_category_name 
    FROM
    production__product_category
)

select * from final

