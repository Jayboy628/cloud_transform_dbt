
with sales_person as (

	select * from {{ source('sales','salesperson')}}
),

final as 

(

select
    BUSINESSENTITYID as business_entity_id,
	TERRITORYID as territory_id,
	SALESQUOTA as sales_quita,
	BONUS as bonus,
	COMMISSIONPCT as commission_pct,
	SALESYTD as sales_ytd,
	SALESLASTYEAR as sales_last_year,
	MODIFIEDDATE as modified_date

from sales_person

)
select * from final