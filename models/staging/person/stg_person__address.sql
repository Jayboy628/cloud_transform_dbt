with address as (

select * from {{source('person','address')}}

),

final as 

(

    select
        AddressID AS address_id,
        AddressLine1 AS address_line_1,
        AddressLine2 AS address_line_2,
        City AS city,
        StateProvinceID AS state_province_id,
        PostalCode AS postal_code,
        rowguid AS row_guid,
        ModifiedDate AS modified_date

   from address

 )

select * from final