module Api
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_order, only: %i[ show edit update destroy ]
    before_action :require_logged_in!
    include OrdersHelper

    def index
      @orders = Order.all
    end

    def show; end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
			if @order.save
        TimerStatusJob.perform_later(@order)
        save_diches_in_order(@order.id, params[:dishes])
        calculate_subtotal_total(@order)
				render 'api/orders/show', status: :created
			else
				render json: @order.errors, status: :unprocessable_entity 
			end
    end

    def update
			if @order.update_attribute(:order_state_id , params[:order_state_id])
				render 'api/orders/show', status: :created
			else
				render json: @order.errors, status: :unprocessable_entity
			end
    end

    private
      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.require(:order).permit( :client_id, dishes: [:amount,:id] ).merge( order_state_id: "1" )
      end

      def save_diches_in_order(order_id, dishes)
        dishes.map do |dish| 
          DishInOrder.create(amount: dish[:amount] ,dish_id: dish[:id], order_id: order_id)
        end
      end
  end
end
