with sales_territory as (

	select * from {{ source('sales','salesterritory')}}
),

final as 
(

	select
		TERRITORYID as territory_id,
		NAME as name,
		COUNTRYREGIONCODE as country_region_code,
		GROUPS as group_name,
		SALESYTD as sales_ytd,
		SALESLASTYEAR as sales_last_year,
		COSTYTD as cost_ytd,
		COSTLASTYEAR as cost_last_year,
		MODIFIEDDATE as modified_date

	from sales_territory

)

select * from final