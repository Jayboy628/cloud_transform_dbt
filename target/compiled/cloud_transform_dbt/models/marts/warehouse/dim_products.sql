with v_product as
(
    select *,
           
    
md5(cast(coalesce(cast(STANDARDCOST as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(LISTPRICE as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(MODIFIEDDATE as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as t1_key
    from raw.production.product
), v_this as
(
    select *,
           
    
md5(cast(coalesce(cast(STANDARDCOST as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(LISTPRICE as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(MODIFIEDDATE as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as t1_key
    from ANALYTICS_DEV.warehouse.dim_products
)

select t2.product_key,t2.PRODUCTID as PRODUCTID,
    t2.PRODUCTMODELID as PRODUCTMODELID,
    t2.PRODUCTSUBCATEGORYID as PRODUCTSUBCATEGORYID,
    t2.NAME as NAME,
    
    case when (d.dbt_valid_to is null  
                        and d.t1_key != s.t1_key) then s.STANDARDCOST
                when (d.product_key is not null) then d.STANDARDCOST
                else t2.STANDARDCOST end as STANDARDCOST,
    case when (d.dbt_valid_to is null  
                        and d.t1_key != s.t1_key) then s.LISTPRICE
                when (d.product_key is not null) then d.LISTPRICE
                else t2.LISTPRICE end as LISTPRICE,
    case when (d.dbt_valid_to is null  
                        and d.t1_key != s.t1_key) then s.MODIFIEDDATE
                when (d.product_key is not null) then d.MODIFIEDDATE
                else t2.MODIFIEDDATE end as MODIFIEDDATE
    ,
    case when (t2.dbt_valid_to is null 
                    and d.t1_key != s.t1_key) then convert_timezone('America/New_York',current_timestamp::timestamp)
             when (d.product_key is not null) then d.dbt_updated_at
             else convert_timezone('America/New_York',t2.dbt_updated_at::timestamp) end as dbt_updated_at
,convert_timezone('America/New_York',t2.dbt_valid_from::timestamp) as dbt_valid_from,
      convert_timezone('America/New_York',t2.dbt_valid_to::timestamp) as dbt_valid_to
from ANALYTICS.snapshots.snap__product t2
    left join v_product s
        on t2.productid = s.productid
    left join v_this d
        on t2.product_key = d.product_key