
with sales_order_detail as (

	select * from {{ source('sales','salesorderdetail')}}
),

final as 

(

select
	SALESORDERID as sales_order_id,
	SALESORDERDETAILID as sales_order_detail_id,
	CARRIERTRACKINGNUMBER as carrier_tracking_number,
	ORDERQTY as order_qty,
	PRODUCTID as product_id,
	SPECIALOFFERID as special_offer_id,
	UNITPRICE as unit_price,
	UNITPRICEDISCOUNT as unit_price_discount,
	LINETOTAL as line_total,
	ROWGUID as row_guid,
	MODIFIEDDATE as modified_date

from sales_order_detail

)
select * from final
