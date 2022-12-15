
with country_region as (

    select * from {{ source('person','countryregion') }}
),

final as 

(

        select
            COUNTRYREGIONCODE as country_region_code,
            NAME as name,
            to_date(MODIFIEDDATE) as modified_date
            
        from country_region

)
select * from final
