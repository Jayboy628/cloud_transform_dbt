
with product_category as (

	select * from {{ source('production','productcategory')}}
),

final as 

(

	select
		PRODUCTCATEGORYID as product_category_id,
		Name AS product_category_name ,
		MODIFIEDDATE as modified_date
		
	from product_category
)
	select * from final
