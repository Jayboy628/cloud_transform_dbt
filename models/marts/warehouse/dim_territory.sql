

with sales_territory as 
(
    select * from {{ref('stg_sales__sales_territory')}}
),

country_region as 

(
    select * from {{ref('stg_person__country_region')}}
),

final as 

(

SELECT 
    md5(territory_id) as territory_key,
    territory_id, 
    st.name AS territory_name, 
    cr.name as country_name, 
    group_name
FROM sales_territory st 
left outer join country_region cr on cr.country_region_code = st.country_region_code

)

select * from final





