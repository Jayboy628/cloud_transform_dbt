with dates as (
    
    select * from {{ source('public','dates') }}
),

final as 

(

        select 
            DateKey as date_key,
            FullDateAlternateKey as full_date,
            DayNumberOfWeek as day_number_of_week,
            EnglishDayNameOfWeek as name_of_week,
            DayNumberOfMonth as day_number_OfMonth,
            DayNumberOfYear as day_number_of_year,
            WeekNumberOfYear as week_number_of_year,
            EnglishMonthName as month_name,
            MonthNumberOfYear as month_number_of_year,
            CalendarQuarter as cal_quarter,
            CalendarYear as cal_year,
            CalendarSemester as cal_semester,
            FiscalQuarter as fiscal_quarter,
            FiscalYear as fiscal_year,
            FiscalSemester as fiscal_semester
            
        from dates       

)
select * from final