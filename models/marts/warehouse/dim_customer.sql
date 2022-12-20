with business_entity_contact as
(

    select * from {{ref('stg_person__business_entity_contact')}}

),

contact_type as 

(
    select * from {{ref('stg_person__contact_type')}}
),

 business_entity_contact_type as 

(
    select business_entity_id,max(ct.contact_type_id) as contact_type_id
    from business_entity_contact bec 
    left outer join contact_type ct on ct.contact_type_id = bec.contact_type_id
    group by business_entity_id
),

 customer as 

(
    select * from {{ref('stg_sales__customer')}}
),

 person as

(
    select * from {{ref('stg_person__person')}}
),

email_address as

(
    select * from {{ref('stg_person__email_address')}}
),

person_phone as 

(
    select * from {{ref('stg_person__person_phone')}}
),

 business_entity_address as

(
    select * from {{ref('stg_person__business_entity_address')}}
),

 address as 

(
    select * from {{ref('stg_person__address')}}
),

 state_province as

(
    select * from {{ref('stg_person__state_province')}}
),

 country_region as

(
    select * from {{ref('stg_person__country_region')}}
),

store as

(
    select * from {{ref('stg_sales__store')}}
),

 final as

(
    select
    {{dbt_utils.surrogate_key('c.person_id') }} as customer_key
    ,case when c.person_id is not null then c.person_id else store_id end as Customer_ID
    ,case when store_id is not null then 'Retailer' else 'Online' end as Channel
    ,case when store_id is not null then store_id :: varchar(10)||' '|| s.name  else
     c.person_id :: varchar(10)|| ' ' || coalesce(p.first_name,'') || ' ' || LEFT(coalesce(p.middle_name,''),1)
     || case when p.middle_name is not null then '. ' else '' end || coalesce(p.last_name,'')end as CustomerFullname
    , case when c.person_id is not null then p.title when p2.business_entity_id is not null then p2.title end as title
    , case when c.person_id is not null then p.first_name when p2.business_entity_id is not null then p2.first_name end as first_name
    , case when c.person_id is not null then p.middle_name when p2.business_entity_id is not null then p2.middle_name end as middle_name
    , case when c.person_id is not null then p.last_name when p2.business_entity_id is not null then p2.last_name end as last_name
    , case when c.person_id is not null then ea.email_address when p2.business_entity_id is  not null then ea2.email_address end as email_address
    , pp.phone_number as phone
    , case when store_id is not null then a2.address_line_1 else a.address_line_1 end as address_line_1
    , case when store_id is not null then a2.address_line_2 else a.address_line_2 end as address_line_2
    , case when store_id is not null then a2.city else a.city end as city
    , case when store_id is not null then sp2.state_province_code else sp.state_province_code end as state_province_code
    , case when store_id is not null then sp2.name else sp.name end as StateProvince
    , case when store_id is not null then cr2.country_region_code else cr.country_region_code end as country_region_code
    , case when store_id is not null then cr2.name else cr.name end as Country
    , case when store_id is not null then a2.postal_code else a.postal_code end as postal_code
    , s.name as retailer_name
from customer c 
    left outer join person p on p.business_entity_id = c.person_id
    left outer join email_address ea on ea.business_entity_id = p.business_entity_id
    left outer join person_phone pp on pp.business_entity_id = p.business_entity_id
    left outer join business_entity_address bea on bea.business_entity_id = p.business_entity_id
    left outer join business_entity_address bea2 on bea2.business_entity_id = c.store_id
    left outer join address a on a.address_id = bea.address_id

    left outer join address a2 on a2.address_id = bea2.address_id
    left outer join state_province sp on a.state_province_id = sp.state_province_id
    left outer join state_province sp2 on a2.state_province_id = sp2.state_province_id
    left outer join country_region cr on cr.country_region_code = sp.country_region_code
    left outer join country_region cr2 on cr2.country_region_code = sp2.country_region_code
    left outer join store s on c.store_id = s.business_entity_id
    left outer join business_entity_contact_type bect on bect.business_entity_id = s.business_entity_id
    left outer join business_entity_contact bec on bect.business_entity_id = bec.business_entity_id and bect.contact_type_id = bec.contact_type_id
    left outer join person p2 on p2.business_entity_id = bec.person_id
    left outer join email_address ea2 on ea2.business_entity_id = p2.business_entity_id
 )

select   * from final