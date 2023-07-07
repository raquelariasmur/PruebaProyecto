json.array! @orders do |order|
  json.id order.id
  json.total order.total
  json.client do
    json.id order.client.id
    json.name "#{order.client.firstname} #{order.client.lastname}"
  end
  json.state order.order_state.name
  json.dishes(order.dish_in_orders) do |dish_in_order|
    json.amount dish_in_order.amount
    json.call(dish_in_order.dish,
      :id,
      :name,
      :description,
      :price
    )
    json.photography rails_blob_url(dish_in_order.dish.photography)#  dish_in_order.dish
  end 
  json.subtotal order.subtotal
  json.total order.total
  json.created order.created_at.strftime("%d-%b-%Y %l:%M%P")
  json.created_at order.created_at
end