with employee_department_history as (

	select * from {{source('hr','employee_department_history') }}
),

final as 

(

	select 
		BUSINESSENTITYID as business_entity_id,
		DEPARTMENTID as department_id,
		SHIFTID as shift_id,
		STARTDATE as start_date,
		ENDDATE as end_date,
		MODIFIEDDATE as modified_date

	from employee_department_history

)

select * from final