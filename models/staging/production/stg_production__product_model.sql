
with product_model as (

    select * from {{ source('production','productmodel')}}

),

final as 

(

    select
        PRODUCTMODELID as product_model_id,
        NAME as name,
        ROWGUID as row_guid,
        MODIFIEDDATE as modified_date
        
    from product_model

)
select * from final
