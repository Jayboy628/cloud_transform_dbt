
with person_phone as (

	select * from {{ source('person','personphone') }}
),

final as 

(

	select
		BUSINESSENTITYID as business_entity_id,
		PHONENUMBER phone_number,
		PHONENUMBERTYPEID as phone_number_type_id,
		MODIFIEDDATE as modified_date

	from person_phone
)

select * from final
