select 
    orders.*,
    order_itmes_summary.gross_item_sales_amount,
    order_itmes_summary.item_discount_amount,
from 
    {{ref ('stg_tpch_orders')}} as orders
join 
    {{ref ('int_order_items_summary')}} as order_itmes_summary
        on orders.order_key = order_itmes_summary.order_key
order by order_date
