with business_entity_address as (

select * from {{source('person','businessentityaddress')}}

),

final as 

(

    select
        BUSINESSENTITYID as business_entity_id,
        ADDRESSID as address_id,
        ADDRESSTYPEID as address_type_id,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date

   from business_entity_address

 )

select * from final