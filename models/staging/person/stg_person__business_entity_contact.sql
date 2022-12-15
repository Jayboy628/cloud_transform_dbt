
with business_entity_contact as (

    select * from {{ source('person','businessentitycontact')}}
),

final as 

(

    select
        BUSINESSENTITYID as business_entity_id,
        PERSONID as person_id,
        CONTACTTYPEID as contact_type_id,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date
        
    from business_entity_contact
)
select * from final 