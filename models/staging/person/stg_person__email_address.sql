
with email_address as (

    select * from {{source('person','emailaddress')}}
),

final as 

(

        select
            BUSINESSENTITYID as business_entity_id,
            EMAILADDRESSID as email_address_id,
            EMAILADDRESS as email_address,
            MODIFIEDDATE as modified_date
            
        from email_address

)
select * from final
