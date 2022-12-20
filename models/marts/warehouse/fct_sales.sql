

with sales_order_header as 
(
    select * from {{ref('stg_sales__sales_order_header')}}
),

sales_order_detail as 

(
    select * from {{ref('stg_sales__sales_order_detail')}}
),

dates as 

(
    select * from {{ref('dim_date')}}
),

customer as 

(
    select * from {{ref('dim_customer')}}
),

product as 

(
    select * from {{ref('dim_product')}}
),

employee as 

(
    select * from {{ref('dim_employee')}}
),

territory as 

(
    select * from {{ref('dim_territory')}}
),

final as

(

    select

        date_key,
        c.Customer_Key,
        e.Employee_Key,
        t.Territory_Key,
        p.Product_Key,
        d.full_date,
        Order_Qty as Sales_Quantity,
        Line_Total - (Order_Qty * Unit_Price_Discount) as Sales_Amount,
        Order_Qty * Unit_Price_Discount as Discount_Amount,
        Standard_Cost as Product_Cost,
        soh.Sales_Order_ID as Order_Number,
        Sales_Order_Detail_ID as Order_Line_Number
    from sales_order_header soh
    inner join sales_order_detail sod on soh.Sales_Order_ID = sod.Sales_Order_ID
    left outer join dates d on d.full_date = soh.order_date
    left outer join customer c on c.Customer_ID = soh.Customer_ID
    left outer join product p on p.Product_ID = sod.Product_ID
    left outer join employee e on e.Employee_ID = soh.Sales_Person_ID
    left outer join territory t on t.Territory_ID = soh.Territory_ID

)

select * from final

