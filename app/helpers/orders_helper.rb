module OrdersHelper
    def calculate_subtotal_total(order)
        subtotal = 0
        order.dish_in_orders.map do |dish_in_order|
            subtotal += dish_in_order.dish.price * dish_in_order.amount;
        end
        total = subtotal + (subtotal*0.13)
        order.update_attribute(:subtotal, subtotal)
        order.update_attribute(:total, total)
    end
end

