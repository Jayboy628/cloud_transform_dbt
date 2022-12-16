
with sales_order_header as (

	select * from {{ source('sales','salesorderheader')}}
),

final as 

(

select
	SALESORDERID as sales_order_id,
	REVISIONNUMBER as Revision_number,
	ORDERDATE as order_date,
	DUEDATE as due_date,
	SHIPDATE as ship_date,
	STATUS as status,
	ONLINEORDERFLAG as online_order_flag,
	SALESORDERNUMBER as sales_order_number,
	PURCHASEORDERNUMBER as purchase_order_number,
	ACCOUNTNUMBER as account_number,
	CUSTOMERID as customer_id,
	SALESPERSONID as sales_person_id,
	TERRITORYID as territory_id,
	BILLTOADDRESSID as bill_to_address_id,
	SHIPTOADDRESSID as ship_to_address_id,
	SHIPMETHODID as ship_method_id,
	CREDITCARDID as credit_card_id,
	CREDITCARDAPPROVALCODE as credit_card_approval_code,
	CURRENCYRATEID as currency_rated_id,
	SUBTOTAL sub_total,
	TAXAMT as tax_amount,
	FREIGHT as freight,
	TOTALDUE as total_due,
	COMMENT as comment,
	ROWGUID as row_guid,
	MODIFIEDDATE as modified_date

from sales_order_header

)

select * from final