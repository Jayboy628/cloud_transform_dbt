with employee as (
    
    select * from {{ source('humanresources','employee') }}
),

final as 

(

        select 
            BusinessEntityID as business_entity_id,
            NationalIDNumber as national_id_number,
            LoginID as login_id,
            JobTitle as job_title,
            BirthDate as birth_day,
            MaritalStatus as marital_status,
            Gender as gender,
            HireDate as hire_date,
            SalariedFlag as salaried_flag,
            VacationHours as vacation_hours,
            SickLeaveHours as sick_leave_hour,
            CurrentFlag as current_flag,
            rowguid as row_guid,
            ModifiedDate as modified_date
            
        from employee

)

select * from final