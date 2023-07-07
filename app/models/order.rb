class Order < ApplicationRecord

    belongs_to :order_state
    belongs_to :client

    has_many :dish_in_orders, dependent: :destroy
    has_many :dishes, through: :dish_in_orders

    

    scope :search_by_client_state_date, ->(search, start_date, end_date, date_check, order_state_id, state_check) {  

        params_to_filter_by_client_name = "#{!search.nil? && !search.empty? ? "(UPPER(firstname) LIKE UPPER('%#{search}%') OR UPPER(lastname) LIKE UPPER('%#{search}%') OR CONCAT(UPPER(firstname) , ' ', UPPER(lastname) ) LIKE UPPER('%#{search}%'))" : ""}"
        to_filter_by_state = "#{state_check == "1" &&!search.nil? && !search.empty? ? " AND " : ""}"
        params_to_filter_by_state = "#{state_check == "1" ? "order_state_id = '#{order_state_id}'" : ""}"
        to_filter_by_date = "#{state_check == "1" && date_check == "1" && start_date.present? && end_date.present? && start_date <= end_date || !search.nil? &&!search.empty? && date_check == "1" && start_date.present? && end_date.present? && start_date <= end_date ? " AND " : ""}"
        params_to_filter_by_date = "#{date_check == "1" && start_date.present? && end_date.present? && start_date <= end_date ? "(orders.created_at::date BETWEEN '#{start_date}' AND '#{end_date}')" : ""}"

        where("#{params_to_filter_by_client_name}#{to_filter_by_state}#{params_to_filter_by_state}#{to_filter_by_date}#{params_to_filter_by_date}")
    }
    after_commit do
        @orders = Order.all
        orders_json = JSON.parse( ApplicationController.render(template: 'api/orders/index',assigns: { orders: @orders } ))
        ActionCable.server.broadcast 'orders_channel', orders_json
    end
end
