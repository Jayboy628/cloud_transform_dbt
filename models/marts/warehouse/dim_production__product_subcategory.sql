
with product_subcategory as 
(
    select * from {{ref('stg_production__product_subcategory')}}
),

product_category as

(
    select * from {{ref('dim_production__product_category')}}
),

final as 
(

SELECT
    md5(product_subcategory_id) as product_subcategory_key,
    product_subcategory_id,
    Name AS product_subcategory_name,
    pc.product_category_id
FROM product_subcategory ps
    left outer join product_category pc on pc.product_category_id = ps.product_category_id

)

select * from final