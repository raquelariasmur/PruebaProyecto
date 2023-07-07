json.order_state do 
  json.id @order_state.id
  json.name t("activerecord.attributes.order_state.names.#{@order_state.name}")
  json.time_in_minutes @order_state.time_in_minutes
end
