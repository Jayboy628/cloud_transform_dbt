
with product_subcategory as (

	select * from {{ source('production','productsubcategory')}}
),

final as 

(

	select
		PRODUCTSUBCATEGORYID as product_subcategory_id,
		PRODUCTCATEGORYID as product_category_id,
		NAME as name,
		MODIFIEDDATE as modified_date

	from product_subcategory
)
select * from final