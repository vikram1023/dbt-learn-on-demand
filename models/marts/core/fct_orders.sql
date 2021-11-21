with orders as (
    select * from {{ref('stg_orders')}}
),

payment as (
    select amount,orderid from {{ref('stg_payments')}}
),

final as (

    select a.order_id,a.customer_id,b.amount
     from orders a, payment b
     where a.order_id = b.orderid
)

select * from final