

with date as 
(
    select * from {{ref('stg_public__dates')}}
),


final as 

(

SELECT 
             date_key,
             full_date,
             day_number_of_week,
             name_of_week,
             day_number_OfMonth,
             day_number_of_year,
             week_number_of_year,
             month_name,
             month_number_of_year,
             cal_quarter,
             cal_year,
             cal_semester,
             fiscal_quarter,
             fiscal_year,
             fiscal_semester
FROM date


)

select * from final












