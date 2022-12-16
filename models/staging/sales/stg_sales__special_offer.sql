
with special_offer as (

    select * from {{ source('sales','specialoffer')}}
),

final as

(
    select
        SPECIALOFFERID as special_offer_id,
        DESCRIPTION as description,
        DISCOUNTPCT as discount_pct,
        TYPE as type,
        CATEGORY as category,
        STARTDATE as start_date,
        ENDDATE as end_date,
        MINQTY as min_qty,
        MAXQTY as max_qty,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date

    from special_offer
)

select * from final