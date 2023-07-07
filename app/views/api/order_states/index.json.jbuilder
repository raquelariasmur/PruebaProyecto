json.array! @order_states do |order_state|
  json.id order_state.id
  json.label t("activerecord.attributes.order_state.names.#{order_state.name}")
  json.value order_state.name
end

