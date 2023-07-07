json.order do
  json.id @order.id
  json.total @order.total
  json.subtotal @order.subtotal
  json.order_state @order.order_state.name
  json.dishes(@order.dish_in_orders) do |dish_in_order|
      json.id dish_in_order.dish_id
      json.amount dish_in_order.amount
  end 
end