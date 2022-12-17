
with employee as 
(
    select * from {{ref('stg_humanresources__employee')}}
),

person as 

(
    select * from {{ref('stg_person__person')}}
),


sales_person as

(
    select * from {{ref('stg_sales__sales_person')}}
),

employee_department_history as

(
    select * from {{ref('stg_humanresources__employee_department_history')}}
),

department as

(
    select * from {{ref('stg_humanresources__department')}}
),

email_address as

(
    select * from {{ref('stg_person__email_address')}}
),

person_phone as

(
     select * from {{ref('stg_person__person_phone')}}
),

final as

(
    select
    md5(e.business_entity_id) as employee_key,
    e.business_entity_id as employee_id,
    coalesce(p.first_name,'')  || ' ' || LEFT(coalesce(p.middle_name,''),1) || case when p.middle_name
    is not null then '. ' else '' end || coalesce(p.last_name,'') as employee_full_name,
    p.first_name as employee_first_name,
    p.last_name as employee_last_name,
    p.middle_name as employee_middle_name,
    case when current_flag = 1 then 'Y' else 'N' end as is_current_employee,
    case when sp.business_entity_id is not null then 'Y' else 'N' end as is_sales_person,
    job_title,
    d.department_name as department,
    d.group_name as department_group,
    hire_date,
    login_id,
    ea.email_address,
    pp.phone_number
from employee e
    left outer join person p on e.business_entity_id = p.business_entity_id
    left outer join sales_person sp on sp.business_entity_id = e.business_entity_id
    left outer join employee_department_history edh on edh.business_entity_id = e.business_entity_id
    left outer join department d on d.department_id = edh.department_id
    left outer join email_address ea on ea.business_entity_id = e.business_entity_id
    left outer join person_phone pp on pp.business_entity_id = e.business_entity_id
where edh.end_date is null
)

select * from final