with sales_reason as (

    select * from {{ source('sales','salesreason')}}
),

final as 
(

    select
        SALESREASONID as sales_reason_id,
        NAME as name,
        REASONTYPE as reason_type,
        MODIFIEDDATE as modified_date

    from sales_reason

)

select * from final