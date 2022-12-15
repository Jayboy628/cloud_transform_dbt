
with state_province as (

    select * from {{ source('person','stateprovince') }}
),

final as 

(

    select
        STATEPROVINCEID as state_province_id,
        STATEPROVINCECODE as state_province_code,
        COUNTRYREGIONCODE as country_region_code,
        ISONLYSTATEPROVINCEFLAG as is_only_state_province_flag,
        NAME as name,
        TERRITORYID as territory_id,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date
        
    from state_province

)
select * from final
