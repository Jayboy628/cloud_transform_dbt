with store as (

	select * from {{ source('sales','store')}}
),

final as 

(

	select
		BUSINESSENTITYID as business_entity_id,
        NAME as name,
        SALESPERSONID as sales_person_id,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date
		
	from store

)
select * from final