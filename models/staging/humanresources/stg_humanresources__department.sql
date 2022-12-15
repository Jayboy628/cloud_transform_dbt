with department as (
    
    select * from {{ source('humanresources','department') }}
),

final as 

(

        select 
            DEPARTMENTID AS department_ID,
            NAME as department_name,
            GROUPNAME as group_name,
            to_date(MODIFIEDDATE) as modified_date
            
from department

)

select * from final
