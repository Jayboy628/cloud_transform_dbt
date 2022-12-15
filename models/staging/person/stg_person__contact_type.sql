with contact_type as (

    select * from {{ source('person','contacttype') }}
),

final as 

(

    select
        CONTACTTYPEID as contact_type_id,
        NAME as name,
        to_date(MODIFIEDDATE) as modified_date
        
    from contact_type

)
select * from final