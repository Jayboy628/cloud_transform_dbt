with person as (

select * from {{source('person','person')}}

),

final as 

(

    select
        BUSINESSENTITYID as business_entity_id,
        PersonType as person_type,
        NameStyle as name_style,
        Title as title,
        FIRSTNAME as first_name,
        LASTNAME as last_name,
        MIDDLENAME as middle_name,
        Suffix as suffix,
        MODIFIEDDATE as modified_date
    
   from person
)
select * from final