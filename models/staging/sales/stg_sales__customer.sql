
with customer as (

	select * from {{ source('sales','customer')}}
),

final as 

(

	select
		CUSTOMERID as customer_id,
		PERSONID as person_id,
		STOREID as store_id,
		TERRITORYID as territory_id,
		ACCOUNTNUMBER as account_number,
		ROWGUID as row_guid,
		MODIFIEDDATE as modified_date
		
	from customer

)
select * from final